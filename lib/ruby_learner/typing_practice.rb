require 'fileutils'
require 'ruby_learner/methods.rb'

class TypingPractice

  def initialize(workshop_dir: String)
    @workshop_dir = workshop_dir
  end
  def prac_sequence(origin_rand_dir: String)
    FileUtils.cp("#{origin_rand_dir}/workplace.rb", "#{@workshop_dir}/workshop.rb")
    FileUtils.cp("#{origin_rand_dir}/sentence.org", "#{@workshop_dir}/sentence.org")
    FileUtils.cp("#{origin_rand_dir}/answer.rb", "#{@workshop_dir}/answer.rb")
    system "cd #{@workshop_dir} && emacs -nw -q -l ~/ruby_learner/workshop/emacs.d/init.el sentence.org workplace.rb"
    start_time = Time.now
    typing_discriminant(answer_path: "#{@workshop_dir}/workplace.rb", question_path: "#{@workshop_dir}/sentence.org")
    elapsed_time = time_check(start_time: start_time)
    p "#{elapsed_time} sec"
    # mk_training_data(elapsed_time: elapsed_time, prac_dir: @prac_dir)
  end
end
