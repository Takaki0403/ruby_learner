class Common
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
      system("cd #{workshop_dir} && mv emacs.d .emacs.d")
      system("cd #{workshop_dir} && mv rspec .rspec")
    end
  end

  def get_app_ver(app_name: String)
    app_vers = Open3.capture3("gem list #{app_name}")
    latest_ver = app_vers[0].chomp.gsub(' (', '-').gsub(')','')
    return latest_ver
  end
end
