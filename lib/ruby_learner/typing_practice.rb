require 'fileutils'
require 'ruby_learner/methods.rb'

class TypingPractice

   def initialize(prac_dir: String)
    @prac_dir = prac_dir
  end
  def prac_sequence(origin_file: String)
    cp_file(origin_file: origin_file, clone_file: "#{@prac_dir}/question.org")
    system "cd #{@prac_dir} && emacs question.rb answer.rb"
    start_time = Time.now
    typing_discriminant(answer_path: "#{@prac_dir}/answer.rb", question_path: "#{@prac_dir}/question.rb")
    elapsed_time = time_check(start_time: start_time)
    p "#{elapsed_time} sec"
    # mk_training_data(elapsed_time: elapsed_time, prac_dir: @prac_dir)
  end
end
