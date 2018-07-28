require 'fileutils'
require 'ruby_learner/methods.rb'

class TypingPractice

  def initialize(workshop_dir: String)
    @workshop_dir = workshop_dir
  end
  def prac_sequence(origin_rand_dir: String)
    FileUtils.cp("#{origin_rand_dir}/lib/workplace.rb", "#{@workshop_dir}/lib/workshop.rb")
    FileUtils.cp("#{origin_rand_dir}/lib/sentence.org", "#{@workshop_dir}/lib/sentence.org")
    FileUtils.cp("#{origin_rand_dir}/lib/answer.rb", "#{@workshop_dir}/lib/answer.rb")
    FileUtils.cp("#{origin_rand_dir}/spec/workplace_spec.rb", "#{@workshop_dir}/spec/workplace_spec.rb")
    system "cd #{@workshop_dir}/lib && emacs -nw -q -l ~/ruby_learner/workshop/emacs.d/init.el sentence.org workplace.rb"
    start_time = Time.now
    typing_discriminant(answer_path: "#{@workshop_dir}/lib/workplace.rb", question_path: "#{@workshop_dir}/lib/sentence.org")
    elapsed_time = time_check(start_time: start_time)
    p "#{elapsed_time} sec"
    # mk_training_data(elapsed_time: elapsed_time, prac_dir: @prac_dir)
  end
end
