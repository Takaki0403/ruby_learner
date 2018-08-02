# def open_terminal(init_dir: String)
#   system "osascript -e 'tell application \"Terminal\" to do script \"cd #{init_dir} \" '"
# end
require 'rubocop'

def spell_diff_check(file1: String, file2: String)
  stdin, stdout, stderr = Open3.popen3("diff -c #{file1} #{file2}")
  stdout.each do |diff|
    p diff.chomp
  end
end

def time_check(start_time: Time)
  end_time = Time.now
  elapsed_time = end_time - start_time - 1
  return elapsed_time
end

def rspec_check(dir: workshop_dir)
  loop do
    flag_rspec =  system "cd #{dir} && rspec spec/workplace_spec.rb"
    if flag_rspec == true
      puts "It have been finished!"
      break
    else
      puts "your code did an unexpected move!, please fix."
      instruct_print
      select = STDIN.gets.chomp
      if select == 'exit'
        break
      elsif select == 'answer'
        system "cd #{dir}/lib && emacs -nw -q -l #{dir}/emacs.d/ruby_learner_init.el sentence.org workplace.rb"
      else
        system "cd #{dir}/lib && emacs -nw -q -l #{dir}/emacs.d/init.el  sentence.org workplace.rb"
      end
    end
  end
end

def typing_discriminant(dir: workshop_dir)
  rspec_check(dir: dir)
  rubocop_check(file: "#{dir}/lib/workplace.rb", dir: dir)
end



def instruct_print
  puts "If you continue this mode, press return-key"
  puts "When you want to finish this mode, input 'exit' and press return-key"
  puts "if you check the answer example, input 'answer' and press return_key"
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

def rubocop_check(file: String, dir: workshop_dir)
  puts "Your code doesn't follow coding_rule in Ruby"
  puts 'continue >>> [RET], stop >>> exit'
  continue = STDIN.gets.chomp
  loop do
    if continue == 'exit'
      break
    end
    flag_rubocop = system "rubocop #{file}"
    if  flag_rubocop == true
      puts 'rubocop complete'
      break
    else
      instruct_print
      select = STDIN.gets.chomp
      if select == 'exit'
        break
      elsif select == 'answer'
        system "cd #{dir}/lib && emacs -nw -q -l #{dir}/emacs.d/ruby_learner_init.el sentence.org workplace.rb"
      else
        system "cd #{dir}/lib && emacs -nw -q -l #{dir}/emacs.d/init.el  sentence.org workplace.rb"
      end
      rspec_check(dir: dir)
    end
  end
end
