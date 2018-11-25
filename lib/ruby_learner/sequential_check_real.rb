require 'ruby_learner/sequential_check'
require 'ruby_learner/rubocop_rspec_check'

class SequentialCheckReal < SequentialCheck
  def action(sec, par)
    puts "section_#{sec}/part_#{par}"
    theme_color = File.read("#{@datas_dir}/theme_color.txt").chomp
    mode_dir = "#{@gem_dir}/contents/questions/sequential_check/section_#{sec}/part_#{par}"
    %w{lib/workplace.rb lib/sentence.org lib/answer.rb spec/workplace_spec.rb}.each do |path|
      FileUtils.cp("#{mode_dir}/#{path}", "#{@workshop_dir}/#{path}")
    end
    system "cd #{@workshop_dir}/lib && emacs -nw -q -l #{@datas_dir}/.emacs.d/#{theme_color}/init.el sentence.org workplace.rb"
    write_final_history(sec, par)
  end
end
