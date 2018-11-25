require 'ruby_learner/sequential_check'
require 'ruby_learner/rubocop_rspec_check'

class SequentialCheckReal < SequentialCheck
  def initialize(x, y)
    super
    @theme_color = File.read("#{@datas_dir}/theme_color.txt").chomp
  end

  def action(sec, par)
    puts "section_#{sec}/part_#{par}"
    mode_dir = "#{@gem_dir}/contents/questions/sequential_check/section_#{sec}/part_#{par}"
    %w{lib/workplace.rb lib/sentence.org lib/answer.rb spec/workplace_spec.rb}.each do |path|
      FileUtils.cp("#{mode_dir}/#{path}", "#{@workshop_dir}/#{path}")
    end
    system "cd #{@workshop_dir}/lib && emacs -nw -q -l #{@datas_dir}/.emacs.d/#{@theme_color}/init.el sentence.org workplace.rb"
    write_final_history(sec, par)
  end

  def last_re_action
    system "cd #{@workshop_dir}/lib && emacs -nw -q -l #{@datas_dir}/.emacs.d/#{@theme_color}/init.el sentence.org workplace.rb"
  end
end
