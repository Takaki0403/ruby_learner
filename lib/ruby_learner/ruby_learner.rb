require 'fileutils'
require 'thor'
require 'open3'
require 'ruby_learner/version'
require 'ruby_learner/common'
require 'ruby_learner/sequential_check'
require 'ruby_learner/pair_timer'
require 'ruby_learner/restore'

module RubyLearner
  # ruby_learner CLI main class
  class CLI < Thor
    def initialize(*args)
      super
      @local_dir = "#{ENV['HOME']}/.ruby_learner"
      @workshop_dir = "#{@local_dir}/workshop"
      @restore_dir = "#{@local_dir}/restore"
      @datas_dir = "#{@local_dir}/.datas"
      @gem_dir = File.expand_path("../../../", __FILE__)
      Common.allocate.init_mk_files(gem_dir: @gem_dir, local_dir: @local_dir)
    end

    desc '-v', 'show program version'
    map "-v" => "version"
    def version
      puts RubyLearner::VERSION
    end

    desc 'emacs_key', 'check emacs key-bindings'
    option :image, aliases: :i, type: :boolean
    def emacs_key(*args)
      if options[:image]
        system("open #{@datas_dir}/emacs_help.pdf")
      else
        system("cat #{@datas_dir}/emacs_help.org")
      end
    end

    desc 'pair_popup [time]','popup_per_time'
    map "-p" => "pair_popup"
    def pair_popup(*args)
      if args[0].to_i == nil || args[0].to_i == 0
        puts "your input is #{args[0]}. not exchange time."
        return
      end
      time = args[0].to_i
      popup_file = File.expand_path("../popup_per_time_for_background.rb", __FILE__)
      system("ruby #{popup_file} #{time} &")
    end

    desc 'sequential_check [section:1~11] [part:1~]','learning drill'
    map "-s" => "sequential_check"
    option :next, aliases: :n, type: :boolean
    option :drill, aliases: :d, type: :boolean
    option :last, aliases: :l, type: :boolean
    def sequential_check(*args)
      begin
        sequential_check = SequentialCheck.new(@gem_dir, @local_dir)
        if options[:drill]
          sequential_check.drill_contents
        elsif options[:next]
          sequential_check.next_action
        elsif options[:last]
          sequential_check.last_re_action
        else
          sequential_check.action(args[0], args[1])
        end
      rescue => error
        puts "Error.message: #{error.message}"
        sequential_check.instruct_modes
      end
    end

    desc 'restore','check your restore'
    map "-r" => "restore"
    option :refresh, aliases: :r, type: :boolean
    def restore(*args)
      restore = Restore.new
      if options[:refresh]
        system("rm -rf #{@restore_dir}")
        system("mkdir #{@restore_dir}")
      elsif args.empty? == true
        restore.output
      else
        restore.open(args[0].to_i)
      end
    end

    desc 'install_emacs','install emacs in your mac'
    def install_emacs
      file_path = "#{@datas_dir}/install_emacs.sh"
      system("sh #{file_path}")
    end

    desc 'theme [black or white]',"change ruby_learner's theme"
    def theme(*args)
      args[0].chomp
      if args[0] == 'black' || args[0] == 'white'
        Common.allocate.change_theme(color: args[0], datas_dir: @datas_dir)
      else
        puts "you can change the theme_color, only black or white."
      end
    end
  end
end
