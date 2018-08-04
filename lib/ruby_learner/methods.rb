# -*- coding: utf-8 -*-
# def open_terminal(init_dir: String)
#   system "osascript -e 'tell application \"Terminal\" to do script \"cd #{init_dir} \" '"
# end
require 'rubocop'

def time_check(start_time: Time)
  end_time = Time.now
  elapsed_time = end_time - start_time - 1
  return elapsed_time
end

def typing_discriminant(dir: workshop_dir)
  loop do
    flag_rspec = rspec_check(dir: dir)
    flag_rubocop = rubocop_check(file: "#{dir}/lib/workplace.rb", dir: dir)
    if flag_rspec == true && flag_rubocop == true
      break
    end
  end
  restore(file: "#{dir}/lib/workplace.rb", workshop_dir: dir)
end

def instruct_print
  puts "continue >>> [RET]"
  puts "stop >>> 'exit' + [RET]"
  puts "check answer >>> 'answer' + [RET]"
end

def init_mk_files(gem_dir: String, workshop_dir: String)
  if Dir.exist?(workshop_dir) != true then
    FileUtils.mkdir_p(workshop_dir)
    system("cp -R #{gem_dir}/workshop/* #{workshop_dir}")
  end
end

def get_app_ver(app_name: String)
  app_vers = Open3.capture3("gem list #{app_name}")
  latest_ver = app_vers[0].chomp.gsub(' (', '-').gsub(')','')
  return latest_ver
end

def mk_training_data(elapsed_time: Time, prac_dir: String)
  training_file = "#{prac_dir}/training_data.txt"
  if File.exist?(training_file) != true then
    FileUtils.touch(training_file)
  end
  File.open(training_file, "a") do |file|
    file.puts("#{Time.now} #{elapsed_time.truncate(2)} sec")
  end
end

def rspec_check(dir: workshop_dir)
  puts "**********************************"
  puts "RSpec Error Check"
  puts "**********************************"
  count = 0
  flag_rspec = false
  loop do
    count += 1
    puts "---------------------------"
    puts "Rspec try: #{count}"
    puts "---------------------------"
    flag_rspec =  system "cd #{dir} && rspec spec/workplace_spec.rb"
    if flag_rspec == true
      puts "Rspec check is clear!"
      break
    else
      instruct_print
      select = STDIN.gets.chomp
      if select == 'exit'
        flag_rspec = true
        break
      elsif select == 'answer'
        system "cd #{dir}/lib && emacs -nw -q -l #{dir}/emacs.d/ruby_learner_init.el sentence.org workplace.rb"
      else
        system "cd #{dir}/lib && emacs -nw -q -l #{dir}/emacs.d/init.el  sentence.org workplace.rb"
      end
    end
  end
  return flag_rspec
end

def rubocop_check(file: String, dir: workshop_dir)
  puts "**********************************"
  puts "Rubocop Error Check"
  puts "**********************************"
  count = 0
  flag_rubocop = false
  loop do
    count += 1
    puts "---------------------------"
    puts "Rubocop try: #{count}"
    puts "---------------------------"
    flag_rubocop = system "rubocop #{file}"
    if  flag_rubocop == true
      puts 'Rubocop check is clear!'
      break
    else
      instruct_print
      select = STDIN.gets.chomp
      if select == 'exit'
        flag_rubocop = true
        break
      elsif select == 'answer'
        system "cd #{dir}/lib && emacs -nw -q -l #{dir}/emacs.d/ruby_learner_init.el sentence.org workplace.rb"
      else
        system "cd #{dir}/lib && emacs -nw -q -l #{dir}/emacs.d/init.el  sentence.org workplace.rb"
      end
    end
  end
  return flag_rubocop
end

def restore(file: String, workshop_dir: String)
  restore_file = ""
  line = File.open("#{workshop_dir}/lib/answer.rb") do |f|
    0.times {
      f.gets
    }
    restore_file = f.gets
  end
  restore_file.gsub!(" ", "")
  restore_file.delete!("#")
  Dir::chdir("#{workshop_dir}/restore"){
    file_count = Dir.glob("*.rb").count
    restore_file.insert(-5, "[#{file_count}]")
  }
  system "touch #{workshop_dir}/restore/#{restore_file}"
  system "cp #{workshop_dir}/lib/workplace.rb #{workshop_dir}/restore/#{restore_file}"
end
