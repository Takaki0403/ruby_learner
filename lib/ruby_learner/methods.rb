# -*- coding: utf-8 -*-
# def open_terminal(init_dir: String)
#   system "osascript -e 'tell application \"Terminal\" to do script \"cd #{init_dir} \" '"
# end
require 'rubocop'

def drill_contents
  puts "section_1  1~3"
  puts "section_2  1~2"
  puts "section_3  1"
  puts "section_4  1"
  puts "section_5  1~2"
  puts "section_6  1~4"
  puts "section_7  1~2"
  puts "section_8  1"
  puts "section_9  1~3"
  puts "section_10 1~2"
  puts "section_11 1~2"
end

def final_history(gem_dir)
  docs_dir = "#{gem_dir}/lib/datas"
  final_history = ''
  final_sec = 0
  final_par = 0
  Dir::chdir(docs_dir){
    File.open("final_history_sequential.txt") do |f|
      final_history = f.gets
    end
      final_sec = final_history.match(/(.*)\-/)[1].to_i
      final_par = final_history.match(/\-(.*)/)[1].to_i
  }
  return final_sec, final_par
end

def next_question(final_sec, final_par)
  if final_sec == 1
    if final_par == 1
      next_sec = 1
      next_par = 2
    elsif final_par == 2
      next_sec = 1
      next_par = 3
    else
      next_sec = 2
      next_par = 1
    end
  elsif final_sec == 2
    if final_par == 1
      next_sec = 2
      next_par = 2
    else
      next_sec = 3
      next_par = 1
    end
  elsif final_sec == 3
    next_sec = 4
    next_par = 1
  elsif final_sec == 4
    next_sec = 5
    next_par = 1
  elsif final_sec == 5
    if final_par == 1
      next_sec = 5
      next_par = 2
    else
      next_sec = 6
      next_par = 1
    end
  elsif final_sec == 6
    if final_par == 1
      next_sec = 6
      next_par = 2
    elsif final_par == 2
      next_sec = 6
      next_par = 3
    elsif final_par == 3
      next_sec = 6
      next_par = 4
    else
      next_sec = 7
      next_par = 1
    end
  elsif final_sec == 7
    if final_par == 1
      next_sec = 7
      next_par = 2
    else
      next_sec = 8
      next_par = 1
    end
  elsif final_sec == 8
    next_sec = 9
    next_par = 1
  elsif final_sec == 9
    if final_par == 1
      next_sec = 9
      next_par = 2
    elsif final_par == 2
      next_sec = 9
      next_par = 3
    else
      next_sec = 10
      next_par = 1
    end
  elsif final_sec == 10
    if final_par == 1
      next_sec = 10
      next_par = 2
    else
      next_sec = 11
      next_par = 1
    end
  else
    if final_par == 1
      next_sec = 11
      next_par = 2
    else
      next_sec = 1
      next_par = 1
    end
  end

  return next_sec, next_par
end

def write_final_history(gem_dir, current_sec, current_par)
  docs_dir = "#{gem_dir}/lib/datas"
  Dir::chdir(docs_dir){
    File.open("final_history_sequential.txt","w") do |f|
      f.puts("#{current_sec}-#{current_par}")
    end
  }
end

def sequential_check_main(gem_dir, workshop_dir ,sec, par)
  puts "section_#{sec}/part_#{par}"
  seq_dir = "#{gem_dir}/questions/sequential_check/section_#{sec}/part_#{par}"
  typing_prac_class = TypingPractice.new(workshop_dir: workshop_dir)
  typing_prac_class.prac_sequence(mode_dir: seq_dir)
  write_final_history(workshop_dir, sec, par)
end

def time_check(start_time: Time)
  end_time = Time.now
  elapsed_time = end_time - start_time - 1
  return elapsed_time
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

def typing_discriminant(workshop_dir, gem_dir)
  file = "#{workshop_dir}/lib/workplace.rb"
  loop do
    flag_rspec, flag_rs_exit = rspec_check(workshop_dir, gem_dir)
    if flag_rs_exit == true
      break
    end
    flag_rubocop, flag_rub_exit = rubocop_check(file, workshop_dir, gem_dir)
    if flag_rub_exit == true
      break
    end
    if flag_rspec == true && flag_rubocop == true
      puts "**********************************"
      puts "Final Error Check"
      puts "**********************************"
      check_rs =  system "cd #{workshop_dir} && rspec spec/workplace_spec.rb"
      if check_rs == true
        puts "your code is perfect!"
        break
      else
        puts "not perfect"
      end
    end
  end
  restore(file: "#{workshop_dir}/lib/workplace.rb", workshop_dir: workshop_dir)
end

def rspec_check(workshop_dir, gem_dir)
  puts "**********************************"
  puts "RSpec Error Check"
  puts "**********************************"
  count = 0
  flag_rspec = false
  flag_exit = false
  loop do
    count += 1
    puts "---------------------------"
    puts "Rspec try: #{count}"
    puts "---------------------------"
    flag_rspec =  system "cd #{workshop_dir} && rspec spec/workplace_spec.rb"
    if flag_rspec == true
      puts "Rspec check is clear!"
      break
    else
      instruct_print
      select = STDIN.gets.chomp
      if select == 'exit'
        flag_exit = true
        break
      elsif select == 'answer'
        system "cd #{workshop_dir}/lib && emacs -nw -q -l #{gem_dir}/lib/emacs.d/ruby_learner_init.el sentence.org workplace.rb"
      else
        system "cd #{workshop_dir}/lib && emacs -nw -q -l #{gem_dir}/emacs.d/init.el  sentence.org workplace.rb"
      end
    end
  end
  return flag_rspec, flag_exit
end

def rubocop_check(file, workshop_dir, gem_dir)
  puts "**********************************"
  puts "Rubocop Error Check"
  puts "**********************************"
  count = 0
  flag_rubocop = false
  flag_exit = false
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
        flag_exit = true
        break
      elsif select == 'answer'
        system "cd #{workshop_dir}/lib && emacs -nw -q -l #{gem_dir}/lib/emacs.d/ruby_learner_init.el sentence.org workplace.rb"
      else
        system "cd #{workshop_dir}/lib && emacs -nw -q -l #{gem_dir}/lib/emacs.d/init.el  sentence.org workplace.rb"
      end
    end
  end
  return flag_rubocop, flag_exit
end

def restore(file: String, workshop_dir: String)
  restore_file = ""
  line = File.open("#{workshop_dir}/lib/answer.rb") do |f|
    1.times {
      f.gets
    }
    restore_file = f.gets
  end
  restore_file.gsub!(" ", "")
  restore_file.delete!("#")
  Dir::chdir("#{workshop_dir}/restore"){
    file_count = Dir.glob("*.rb").count
    # restore_file.insert(-5, "[#{file_count}]")
    restore_file.insert(0, "[#{file_count}]")
  }
  system "touch #{workshop_dir}/restore/#{restore_file}"
  system "cp #{workshop_dir}/lib/workplace.rb #{workshop_dir}/restore/#{restore_file}"
end
