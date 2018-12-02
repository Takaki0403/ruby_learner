require 'fileutils'
require 'ruby_learner/common.rb'
require 'ruby_learner/restore'
require 'rubocop'

class RubocopRspecCheck

  def initialize(local_dir, gem_dir)
    @local_dir = local_dir
    @workshop_dir = "#{local_dir}/workshop"
    @restore_dir = "#{local_dir}/restore"
    @data_dir = "#{local_dir}/.data"
    @gem_dir = gem_dir
    theme_color = ""
    File.open("#{@data_dir}/theme_color.txt") do |f|
      theme_color = f.gets.chomp
    end
    @emacs_dir = "#{@data_dir}/.emacs.d/#{theme_color}"
  end

  def action(mode_dir: String, is_copy: Bool)
    start_time = Time.now
    if is_copy
      %w{lib/workplace.rb lib/sentence.org lib/answer.rb spec/workplace_spec.rb}.each do |path|
        FileUtils.cp("#{mode_dir}/#{path}", "#{@workshop_dir}/#{path}")
      end
    end
    system "cd #{@workshop_dir}/lib && emacs -nw -q -l #{@emacs_dir}/init.el sentence.org workplace.rb"
    loop do
      flag_rspec, flag_rs_exit = rspec_check
      break if flag_rs_exit == true
      flag_rubocop, flag_rub_exit = rubocop_check
      break if flag_rub_exit == true
      if flag_rspec == true && flag_rubocop == true
        puts "**********************************"
        puts "Final Error Check"
        puts "**********************************"
        stdout, stderr, status = Open3.capture3("rspec #{@workshop_dir}/spec/workplace_spec.rb")
        if status == 0
          puts "your code is perfect."
          puts 'If you want to run your code, you execute the following command.'
          puts " $ ruby #{@workshop_dir}/lib/workplace.rb"
          break
        else
          puts "not perfect, please fix your code."
        end
      end
    end
    elapsed_time = Common.allocate.time_check(start_time: start_time)
    p "#{elapsed_time} sec"
    restore = Restore.new
    restore.save(file: "#{@workshop_dir}/lib/workplace.rb", elapsed_time: elapsed_time)
  end

  private

  def instruct_print
    puts "continue >>> [RET]"
    puts "stop >>> 'exit' + [RET]"
    puts "check answer >>> 'answer' + [RET]"
  end

  def rspec_check
    puts "**********************************"
    puts "RSpec Error Check"
    puts "**********************************"
    file = "#{@workshop_dir}/spec/workplace_spec.rb"
    return loop_per_checks("rspec", file)
  end

  def rubocop_check
    puts "**********************************"
    puts "Rubocop Error Check"
    puts "**********************************"
    file = "#{@workshop_dir}/lib/workplace.rb"
    return loop_per_checks("rubocop", file)
  end

  def loop_per_checks(check_mode, file)
    count = 0
    flag_check = false
    flag_exit = false
    loop do
      count += 1
      puts "---------------------------"
      puts "#{check_mode} try: #{count}"
      puts "---------------------------"
      flag_check = system "#{check_mode} #{file}"
      if  flag_check == true
        puts "#{check_mode} check is clear!"
        break
      else
        instruct_print
        select = STDIN.gets.chomp
        if select == 'exit'
          flag_exit = true
          break
        elsif select == 'answer'
          system "cd #{@workshop_dir}/lib && emacs -nw -q -l #{@emacs_dir}/answer.el sentence.org workplace.rb"
        else
          system "cd #{@workshop_dir}/lib && emacs -nw -q -l #{@emacs_dir}/init.el  sentence.org workplace.rb"
        end
      end
    end
    return flag_check, flag_exit
  end

end
