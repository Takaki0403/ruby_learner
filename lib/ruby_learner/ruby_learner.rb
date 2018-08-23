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
      system("cat #{@gem_dir}/lib/datas/emacs_help.org")
    end

    desc 'sequential_check [section:1~11] [part:1~]','learning drill'
    option :next, aliases: "-n", type: :boolean
    option :drill, aliases: "-d", type: :boolean
    def sequential_check(*_argv, dir_num, file_num)
      if options[:drill]
        drill_contents
      elsif options[:next]
        final_sec, final_par = final_history(@gem_dir)
        next_sec, next_par = next_question(final_sec, final_par)
        sequential_check_main(@gem_dir, @workshop_dir, next_sec, next_par)
      else
        sequential_check_main(@gem_dir, @workshop_dir, dir_num, file_num)
      end
    end

  end
end
