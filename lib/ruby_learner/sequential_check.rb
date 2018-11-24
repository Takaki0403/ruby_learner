require 'ruby_learner/rubocop_rspec_check'
require 'fileutils'

class SequentialCheck

  def initialize(gem_dir, local_dir)
    @gem_dir = gem_dir
    @local_dir = local_dir
    @workshop_dir = "#{local_dir}/workshop"
    @restore_dir = "#{local_dir}/restore"
    @datas_dir = "#{local_dir}/.datas"
  end

  # non opt, -next
  def action(sec, par)
    puts "section_#{sec}/part_#{par}"
    seq_dir = "#{@gem_dir}/contents/questions/sequential_check/section_#{sec}/part_#{par}"
    rubocop_rspec_check = RubocopRspecCheck.new(@local_dir, @gem_dir)
    rubocop_rspec_check.action(mode_dir: seq_dir)
    write_final_history(sec, par)
  end

  # -last
  def last_re_action()
    final_sec, final_par = get_final_history
    puts "section_#{final_sec}/part_#{final_par}"
    rubocop_rspec_check = RubocopRspecCheck.new(@local_dir, @gem_dir)
    rubocop_rspec_check.action(mode_dir: @local_dir)
  end

  # -drill
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
    puts "section_10\t 1~3\t file_operation"
    puts "section_11\t 1~3\t library"
  end

  private

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
  
  def get_final_history
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
    if final_par == 3
      next_sec = final_sec + 1
      next_sec = 1 if next_sec >= 12
      next_par = 1
    else
      next_par = final_par + 1
    end
    return next_sec, next_par
  end

end
