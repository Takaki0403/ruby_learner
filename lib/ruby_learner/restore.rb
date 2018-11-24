class Restore
  def initialize
    @local_dir = "#{ENV['HOME']}/.ruby_learner"
    @restore_dir = "#{@local_dir}/restore"
  end

  def save(file: String, elapsed_time: Time)
    restore_file = ""
    line = File.open("#{@local_dir}/workshop/lib/answer.rb") do |f|
      1.times {
        f.gets
      }
      restore_file = f.gets
    end
    restore_file.gsub!(" ", "")
    restore_file.delete!("#")
    for_csv(restore_file, elapsed_time)
    Dir::chdir("#{@local_dir}/restore") do
      file_count = Dir.glob("*.rb").count
      restore_file.insert(0, "[#{file_count}]")
    end
    system "touch #{@local_dir}/restore/#{restore_file}"
    system "cp #{@local_dir}/workshop/lib/workplace.rb #{@local_dir}/restore/#{restore_file}"
  end

  def output
    sorted_restores = sort
    if sorted_restores.size < 20
      puts sorted_restores
    else
      system("ls #{@restore_dir}")
      puts "\nlast 5 restore history."
      puts sorted_restores[-5..-1], "\n"
    end
    instruct
  end

  def open(num)
    sorted_restores = sort
    case num
    when 0..sorted_restores.size-1
      filename = sorted_restores[num]
      system("emacs #{@restore_dir}/#{filename}")
    else
      puts "you have #{sorted_restores.size} restore_files."
      puts "you must put 'ruby_learner -r 0~#{sorted_restores.size - 1}.'"
    end
  end

  private

  def instruct
    puts "If you want to open a restore_file, you execute 'ruby_learner -r [number]'"
    puts "ex) ruby_learner -r 3"
    print "If you want to remove all restore_files, you execute 'ruby_learner -r -f'"
  end

  def for_csv(restore_file, elapsed_time)
    now_time = Time.now
    restore_file.gsub!(" ", "")
    restore_file.delete!("#")
    sec_par = restore_file.match(/\d*-\d*/)[0]
    file = File.open("#{@local_dir}/practice_datas.csv", "a") do |f|
      f.puts "#{now_time.year}/#{now_time.month}/#{now_time.day},#{now_time.hour}:#{now_time.min}:#{now_time.sec},#{elapsed_time},#{sec_par}"
    end
  end

  def sort
    restores = []
    dir = Dir.open(@restore_dir)
    dir.each do |file|
      if file != '.' && file != '..' && file != '.empty.rb'
        restores << file.slice(1..file.length)
      end
    end
    sorted_restores = restores.sort_by{|item| item.to_i}
    sorted_restores.each{|item| item.insert(0, "[")}
    dir.close
    sorted_restores
  end
end
