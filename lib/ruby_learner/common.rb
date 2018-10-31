require 'time'

class Common
  def save_restore(file: String, local_dir: String, elapsed_time: Time)
    restore_file = ""
    line = File.open("#{local_dir}/workshop/lib/answer.rb") do |f|
      1.times {
        f.gets
      }
      restore_file = f.gets
    end
    restore_file.gsub!(" ", "")
    restore_file.delete!("#")
    restore_file_for_csv = restore_file.match(/\d-\d/)[0]
    Dir::chdir("#{local_dir}/restore"){
      file_count = Dir.glob("*.rb").count
      restore_file.insert(0, "[#{file_count}]")
    }
    system "touch #{local_dir}/restore/#{restore_file}"
    system "cp #{local_dir}/workshop/lib/workplace.rb #{local_dir}/restore/#{restore_file}"
    now_time = Time.now
    file = File.open("#{local_dir}/practice_datas.csv", "a") do |f|
      f.puts "#{now_time.year}/#{now_time.month}/#{now_time.day},#{now_time.hour}:#{now_time.min}:#{now_time.sec},#{elapsed_time},#{restore_file_for_csv}"
    end

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

  def init_mk_files(gem_dir: String, local_dir: String)
    gem_contents_dir = "#{gem_dir}/contents"
    if Dir.exist?(local_dir) != true then
      FileUtils.mkdir_p("#{local_dir}/workshop")
      system("cp -R #{gem_contents_dir}/workshop/* #{local_dir}/workshop")
      FileUtils.mkdir_p("#{local_dir}/restore")
      system("cp -R #{gem_contents_dir}/restore/* #{local_dir}/restore")
      FileUtils.mkdir_p("#{local_dir}/.datas")
      system("cp -R #{gem_contents_dir}/datas/* #{local_dir}/.datas")
      system("cd #{local_dir}/.datas && mv emacs.d .emacs.d")
      system("cd #{local_dir}/workshop && mv rspec .rspec")
      system("cd #{local_dir}/workshop && mv rubocop.yml .rubocop.yml")
      system("cd #{local_dir}/restore && mv empty.rb .empty.rb")
    end
  end

  def change_theme(color: String, datas_dir: String)
    chmoded = 0
    file_path = "#{datas_dir}/theme_color.txt"
    begin
      File.write(file_path, "#{color}")
      puts "your ruby_learner's color is #{color}!!"
    rescue => error
      system "sudo chmod go+w #{file_path}"
      chmoded += 1
      retry if chmoded < 2
      puts "FileWrite error #{error.message}"
      puts "you should input $sudo chmod go+w #{file_path}"
    end
  end
end
