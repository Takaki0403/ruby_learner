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
      @workshop_dir = "#{ENV['HOME']}/ruby_learner/workshop"
      gem_location = Open3.capture3('gem environment gemdir')
      app_vers = Open3.capture3('gem list ruby_learner')
      rl_ver = app_vers[0].chomp.tr(' ', '-').delete('()')
      @gem_dir = File.join(gem_location[0].chomp, "/gems/#{rl_ver}")
      init_mk_files(gem_dir: @gem_dir, workshop_dir: @workshop_dir)
    end

    desc 'emacs_key', 'check emacs key-bindings'
    def emacs_key
      system("cat #{@workshop_dir}/emacs_help.org")
    end

    desc 'sequential_check [section:1~11] [part:1~]','learning drill'
    option :next, aliases: '-n', type: :boolean
    option :drill, aliases: '-d', type: :boolean
    def sequential_check(*_argv, dir_num, file_num)
      if options['drill']
        drill_contents
      elsif options['next']
        next_question(workshop_dir: @workshop_dir)
      else
        puts "section_#{dir_num}/part_#{file_num}"
        seq_dir = "#{@gem_dir}/questions/sequential_check/section_#{dir_num}/part_#{file_num}"
        typing_prac_class = TypingPractice.new(workshop_dir: @workshop_dir)
        typing_prac_class.prac_sequence(mode_dir: seq_dir)
      end
    end

    desc 'random_check', 'typing and editing practice.'
    def random_check
      rand_num = rand(1..2)
      rand_dir = "#{@gem_dir}/questions/random_check/section_#{rand_num}"
      typing_practice = TypingPractice.new(workshop_dir: @workshop_dir)
      typing_practice.prac_sequence(mode_dir: rand_dir)
    end
  end
end
