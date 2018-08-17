require 'fileutils'
require 'ruby_learner/methods.rb'

class TypingPractice

  def initialize(workshop_dir: String)
    @workshop_dir = workshop_dir
    gem_location = Open3.capture3('gem environment gemdir')
      app_vers = Open3.capture3('gem list ruby_learner')
      rl_ver = app_vers[0].chomp.tr(' ', '-').delete('()')
      @gem_dir = File.join(gem_location[0].chomp, "/gems/#{rl_ver}")
  end
  def prac_sequence(mode_dir: String)
    FileUtils.cp("#{mode_dir}/lib/workplace.rb", "#{@workshop_dir}/lib/workplace.rb")
    FileUtils.cp("#{mode_dir}/lib/sentence.org", "#{@workshop_dir}/lib/sentence.org")
    FileUtils.cp("#{mode_dir}/lib/answer.rb", "#{@workshop_dir}/lib/answer.rb")
    FileUtils.cp("#{mode_dir}/spec/workplace_spec.rb", "#{@workshop_dir}/spec/workplace_spec.rb")
    system "cd #{@workshop_dir}/lib && emacs -nw -q -l ~/ruby_learner/workshop/emacs.d/init.el sentence.org workplace.rb"
    start_time = Time.now
    typing_discriminant(@workshop_dir, @gem_dir)
    elapsed_time = time_check(start_time: start_time)
    p "#{elapsed_time} sec"
    # mk_training_data(elapsed_time: elapsed_time, prac_dir: @prac_dir)
  end
end
