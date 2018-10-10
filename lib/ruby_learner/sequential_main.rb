require 'ruby_learner/typing_practice'
require 'fileutils'
class SequentialMain

  def initialize(gem_dir, workshop_dir)
    @gem_dir = gem_dir
    @workshop_dir = workshop_dir
  end

  def action(sec, par)
    puts "section_#{sec}/part_#{par}"
    seq_dir = "#{@gem_dir}/questions/sequential_check/section_#{sec}/part_#{par}"
    typing_prac_class = TypingPractice.new(@workshop_dir, @gem_dir)
    typing_prac_class.prac_sequence(mode_dir: seq_dir)
    write_final_history(sec, par)
  end

  def write_final_history(sec, par)
    chmoded = 0
    file_dir = "#{@gem_dir}/lib/datas/final_history_sequential.txt"
    begin
      File.write(file_dir, "#{sec}-#{par}")
    rescue => error
      system "sudo chmod go+w #{file_dir}"
      chmoded += 1
      retry if chmoded < 2
      puts "FileWrite error #{error.message}"
      puts "you should input $sudo chmod go+w #{file_dir}"
    end
  end

  def drill_contents
    puts "section_1  1~3"
    puts "section_2  1~3"
    puts "section_3  1~3"
    puts "section_4  1~3"
    puts "section_5  1~3"
    puts "section_6  1~4"
    puts "section_7  1~2"
    puts "section_8  1"
    puts "section_9  1~3"
    puts "section_10 1~2"
    puts "section_11 1~2"
  end

  def get_final_history(gem_dir)
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

  def get_next_question(final_sec, final_par)
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
      elsif final_par == 2
        next_sec = 2
        next_par = 3
      else
        next_sec = 3
        next_par = 1
      end
    elsif final_sec == 3
      if final_par == 1
        next_sec = 3
        next_par = 2
      elsif final_par == 2
        next_sec = 3
        next_par = 3
      else
        next_sec = 4
        next_par = 1
      end
    elsif final_sec == 4
      if final_par == 1
        next_sec = 4
        next_par = 2
      elsif final_par == 2
        next_sec = 4
        next_par = 3
      else
        next_sec = 5
        next_par = 1
      end
    elsif final_sec == 5
      if final_par == 1
        next_sec = 5
        next_par = 2
      elsif final_par == 2
        next_sec = 5
        next_par = 3
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

end
