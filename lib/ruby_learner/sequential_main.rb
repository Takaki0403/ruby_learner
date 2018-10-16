require 'ruby_learner/typing_practice'
require 'fileutils'
class SequentialMain

  def initialize(gem_dir, local_dir)
    @gem_dir = gem_dir
    @local_dir = local_dir
    @workshop_dir = "#{local_dir}/workshop"
    @restore_dir = "#{local_dir}/restore"
    @datas_dir = "#{local_dir}/.datas"
  end

  def action(sec, par)
    puts "section_#{sec}/part_#{par}"
    seq_dir = "#{@gem_dir}/contents/questions/sequential_check/section_#{sec}/part_#{par}"
    typing_prac_class = TypingPractice.new(@local_dir, @gem_dir)
    typing_prac_class.prac_sequence(mode_dir: seq_dir)
    write_final_history(sec, par)
  end

  def last_re_action()
    final_sec, final_par = get_final_history()
    puts "section_#{final_sec}/part_#{final_par}"
    theme_color = ""
    File.open("#{@datas_dir}/theme_color.txt") do |f|
      theme_color = f.gets.chomp
    end
    emacs_dir = "#{@datas_dir}/.emacs.d/#{theme_color}"
    system "cd #{@workshop_dir}/lib && emacs -nw -q -l #{emacs_dir}/init.el sentence.org workplace.rb"
    start_time = Time.now
    typing_prac_class = TypingPractice.new(@local_dir, @gem_dir)
    typing_prac_class.typing_discriminant
    elapsed_time = Common.allocate.time_check(start_time: start_time)
    p "#{elapsed_time} sec"
  end

  def write_final_history(sec, par)
    chmoded = 0
    file_dir = "#{@datas_dir}/final_history_sequential.txt"
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
    puts "section  \t part\t contents"
    puts "section_1\t 1~3\t standard_output"
    puts "section_2\t 1~3\t standard_input"
    puts "section_3\t 1~3\t standard_I/O summary"
    puts "section_4\t 1~3\t comparisons & conditionals"
    puts "section_5\t 1~3\t loop_methods"
    puts "section_6\t 1~3\t array & hash & symbol"
    puts "section_7\t 1~3\t function"
    puts "section_8\t 1~3\t class"
    puts "section_9\t 1~3\t regular_expression"
    puts "section_10\t 1~2\t file_operation"
    puts "section_11\t 1~2\t library"
  end

  def get_final_history()
    final_history = ''
    final_sec = 0
    final_par = 0
    Dir::chdir(@datas_dir){
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
      else
        next_sec = 7
        next_par = 1
      end
    elsif final_sec == 7
      if final_par == 1
        next_sec = 7
        next_par = 2
      elsif final_par == 2
        next_sec = 7
        next_par = 3
      else
        next_sec = 8
        next_par = 1
      end
    elsif final_sec == 8
      if final_par == 1
        next_sec = 8
        next_par = 2
      elsif final_par == 2
        next_sec = 8
        next_par = 3
      else
        next_sec = 9
        next_par = 1
      end
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
      elsif final_par == 2
        next_sec = 10
        next_par = 3
      else
        next_sec = 11
        next_par = 1
      end
    else
      if final_par == 1
        next_sec = 11
        next_par = 2
      elsif final_par == 2
        next_sec = 11
        next_par = 3
      else
        next_sec = 1
        next_par = 1
      end
    end
    return next_sec, next_par
  end

end
