require 'fileutils'
require 'thor'
require 'ruby_learner/version.rb'
require 'open3'
require 'methods'
require 'sequential_main'

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
      sequential_main = SequentialMain.new(@gem_dir, @workshop_dir)
      if options[:drill]
        sequential_main.drill_contents
      elsif options[:next]
        final_sec, final_par = sequential_main.get_final_history(@gem_dir)
        next_sec, next_par = sequential_main.get_next_question(final_sec, final_par)
        sequential_main.action(next_sec, next_par)
      else
        sequential_check_main(dir_num, file_num)
      end
    end

  end
end
