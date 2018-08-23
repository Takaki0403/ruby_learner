require 'fileutils'
require 'common'
require 'rubocop'

class TypingPractice

  def initialize(workshop_dir, gem_dir)
    @workshop_dir = workshop_dir
    @gem_dir = gem_dir
    common = Common.new
  end

  def prac_sequence(mode_dir: String)
    FileUtils.cp("#{mode_dir}/lib/workplace.rb", "#{@workshop_dir}/lib/workplace.rb")
    FileUtils.cp("#{mode_dir}/lib/sentence.org", "#{@workshop_dir}/lib/sentence.org")
    FileUtils.cp("#{mode_dir}/lib/answer.rb", "#{@workshop_dir}/lib/answer.rb")
    FileUtils.cp("#{mode_dir}/spec/workplace_spec.rb", "#{@workshop_dir}/spec/workplace_spec.rb")
    system "cd #{@workshop_dir}/lib && emacs -nw -q -l #{@workshop_dir}/.emacs.d/init.el sentence.org workplace.rb"
    start_time = Time.now
    typing_discriminant(@workshop_dir)
    elapsed_time = common.time_check(start_time: start_time)
    p "#{elapsed_time} sec"
  end

  def typing_discriminant(workshop_dir)
    file = "#{workshop_dir}/lib/workplace.rb"
    loop do
      flag_rspec, flag_rs_exit = rspec_check(workshop_dir)
      if flag_rs_exit == true
        break
      end
      flag_rubocop, flag_rub_exit = rubocop_check(file, workshop_dir)
      if flag_rub_exit == true
        break
      end
      if flag_rspec == true && flag_rubocop == true
        puts "**********************************"
        puts "Final Error Check"
        puts "**********************************"
        stdout, stderr, status = Open3.capture3("rspec #{workshop_dir}/spec/workplace_spec.rb")
        if stdout[0] == '.'
          puts "your code is perfect."
          puts 'If you want to run your code, you execute the following command.'
          puts " $ ruby #{workshop_dir}/lib/workplace.rb"
          break
        else
          puts "not perfect, please fix your code."
        end
      end
    end
    common.restore(file: "#{workshop_dir}/lib/workplace.rb", workshop_dir: workshop_dir)
  end

  def rspec_check(workshop_dir)
    puts "**********************************"
    puts "RSpec Error Check"
    puts "**********************************"
    return flag_rspec, flag_exit = loop_in_checks(check_mode: "rspec", file)
  end

  def rubocop_check(file, workshop_dir)
    puts "**********************************"
    puts "Rubocop Error Check"
    puts "**********************************"
    return flag_rubocop, flag_exit = loop_in_checks(check_mode: "rubocop", file)
  end

  def loop_in_checks(check_mode:String, file)
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
        puts '#{check_mode} check is clear!'
        break
      else
        common.instruct_print
        select = STDIN.gets.chomp
        if select == 'exit'
          flag_exit = true
          break
        elsif select == 'answer'
          system "cd #{workshop_dir}/lib && emacs -nw -q -l #{workshop_dir}/.emacs.d/ruby_learner_init.el sentence.org workplace.rb"
        else
          system "cd #{workshop_dir}/lib && emacs -nw -q -l #{workshop_dir}/.emacs.d/init.el  sentence.org workplace.rb"
        end
      end
    end
    return flag_check, flag_exit
  end

end
