require 'fileutils'
require 'thor'
require 'ruby_learner/version.rb'
require 'open3'
require 'ruby_learner/common.rb'
require 'ruby_learner/sequential_main'

module RubyLearner
  # ruby_learner CLI main class
  class CLI < Thor
    def initialize(*args)
      super
      @workshop_dir = "#{ENV['HOME']}/.ruby_learner/workshop"
      @gem_dir = File.expand_path("../../../", __FILE__)
      Common.allocate.init_mk_files(gem_dir: @gem_dir, workshop_dir: @workshop_dir)
    end

    desc '-v', 'show program version'
    map "-v" => "version"
    def version
      puts RubyLearner::VERSION
    end

    desc 'emacs_key', 'check emacs key-bindings'
    def emacs_key
      system("cat #{@gem_dir}/lib/datas/emacs_help.org")
    end

    desc 'sequential_check [section:1~11] [part:1~]','learning drill'
    option :next, aliases: :n, type: :boolean
    option :drill, aliases: :d, type: :boolean
    def sequential_check(*args)
      begin
        sequential_main = SequentialMain.new(@gem_dir, @workshop_dir)
        if options[:drill]
          sequential_main.drill_contents
        elsif options[:next]
          final_sec, final_par = sequential_main.get_final_history(@gem_dir)
          next_sec, next_par = sequential_main.get_next_question(final_sec, final_par)
          sequential_main.action(next_sec, next_par)
        else
          sequential_main.action(args[0], args[1])
        end
      rescue => error
        puts "Error.message: #{error.message}"
        puts 'sequential_check has 3-modes'
        puts 'mode-1: $ sequential_check [section:1~11] [part:1~] ,ex) sequential_check 1 3'
        puts 'mode-2: $ sequential_check -d, check drill contents'
        puts 'mode-3: $ sequential_check -n, learn next to your last-question'
      end
    end

    desc 'restore','check your restore'
    option :refresh, aliases: :r, type: :boolean
    def restore(*args)
      if options[:refresh]
        system("rm -rf #{@workshop_dir}/restore/")
        system("mkdir #{@workshop_dir}/restore")
      elsif args.empty? == true then
        system("ls #{@workshop_dir}/restore")
        print("\n If you want to open a restore_file, you execute 'ruby_learner restore [file_name]'")
        print("\n If you want to remove all restore_files, you execute 'ruby_learner restore -r'")
      else
        system("emacs #{@workshop_dir}/restore/#{args[0]}")
      end
    end

    desc 'install_emacs','install emacs in your mac'
    def install_emacs
      file_path = "#{@gem_dir}/lib/datas/install_emacs.sh"
      system("sh #{file_path}")
    end

    desc 'theme [black or white]',"change ruby_learner's theme"
    def theme(*args)
      args[0].chomp
      if args[0] == 'black' || args[0] == 'white'
        Common.allocate.change_theme(color: args[0], gem_dir: @gem_dir)
      else
        puts "you can change the theme_color, only black or white."
      end
    end
  end
end
