require 'ruby_learner/common'
require 'ruby_learner/sequential_check'
require 'ruby_learner/rubocop_rspec_check'

class SequentialCheckManual < SequentialCheck
  def initialize(x, y)
    super
    @theme_color = File.read("#{@data_dir}/theme_color.txt").chomp
  end

  def action(sec, par)
    puts "section_#{sec}/part_#{par}"
    mode_dir = "#{@gem_dir}/contents/questions/sequential_check/section_#{sec}/part_#{par}"
    %w{lib/workplace.rb lib/sentence.org lib/answer.rb spec/workplace_spec.rb}.each do |path|
      FileUtils.cp("#{mode_dir}/#{path}", "#{@workshop_dir}/#{path}")
    end
    write_final_history(sec, par)
    intro_next_command
    restore = Restore.new
    restore.save(file: "#{@workshop_dir}/lib/workplace.rb", elapsed_time: 0.0)
  end

  def last_re_action
    puts "This mode doesn't have last-option"
  end

  private

  def intro_next_command
    puts 'Practice setting ok.'
    puts 'Put under commands.'
    puts '$ emacs lib/sentence.org lib/workplace.rb'
    puts '- rspec check'
    puts '$ rspec spec'
    puts '- rubocop check'
    puts '$ rubocop lib/workplace.rb'
    puts '- rspec and rubocop checks'
    puts '$ ruby_learner -s -c'
  end
end
