require 'fileutils'
require 'colorize'
require 'thor'
require 'ruby_learner/version.rb'
require 'diff-lcs'
require 'open3'
require 'ruby_learner/methods.rb'
require 'ruby_learner/typing_practice.rb'

module RubyLearner
  # editor_learner CLI main class
  class CLI < Thor
    def initialize(*args)
      super
      # rl is RubyLearner
      @workshop_dir = "#{ENV['HOME']}/ruby_learner/workshop" # workshop_directory
      @gem_location = Open3.capture3('gem environment gemdir')
      app_vers = Open3.capture3('gem list ruby_learner')
      rl_ver = app_vers[0].chomp.tr(' ', '-').delete('()')
      @rl_origin_dir = File.join(@gem_location[0].chomp, "/gems/#{rl_ver}")
      init_mk_files(origin_dir: @rl_origin_dir, prac_dir: @workshop_dir)
      emacs_other_dir = "#{ENV['HOME']}/.emacs.d/ruby_learner_init.el"
      if Dir.exist?(emacs_other_dir) != true then
        FileUtils.mkdir_p(emacs_other_dir)
        system("cp #{rl_origin_dir}/.emacs.d/ruby_learner_init.el #{emacs_other_dir}")
    end

    desc 'delete [number~number]', 'choose number to delete ruby_files'
    def delete(head_num, end_num)
      range = head_num..end_num
      range.each do |num|
        if File.exist?("#{@workshop_dir}/ruby_#{num}") == true
          system "rm -rf #{@workshop_dir}/ruby_#{num}"
        end
      end
    end

    desc 'sequential_check [dir_num:1~6] [file_num:1~3] ', 'typing and editing practice.'
    def sequential_check(*_argv, dir_num, file_num)
      origin_seq_dir = "#{@rl_origin_dir}/questions/sequential_check_question"
      origin_file_path = "#{origin_seq_dir}/ruby_#{dir_num}/#{file_num}.rb"
      p origin_file_path
      typing_prac_class = TypingPractice.new(prac_dir: @workshop_dir, origin_dir: @rl_origin_dir)
      typing_prac_class.prac_sequence(origin_file: origin_file_path)
    end

    desc 'random_check', 'typing and editing practice.'
    def random_check(*_argv)
      # origin_rand_dir = "#{@rl_origin_dir}/questions/random_check_question/lib"
      # rand_num = rand(1..15)
      # rand_num = 1
      # origin_rand_file = "#{origin_rand_dir}/#{rand_num}.rb"
      rand_num = rand(1..2)
      origin_rand_dir = "#{@rl_origin_dir}/questions/random_check_question/section_#{rand_num}"
      origin_rand_file = "#{origin_rand_dir}/sentence.org"
      # FileUtils.cp('/dev/null', "#{@workshop_dir}/answer.rb")
      FileUtils.cp("#{origin_rand_dir}/workplace.rb", "#{@workshop_dir}/answer.rb")
      typing_prac_class = TypingPractice.new(prac_dir: @workshop_dir)
      typing_prac_class.prac_sequence(origin_file: origin_rand_file)
    end
  end
end
