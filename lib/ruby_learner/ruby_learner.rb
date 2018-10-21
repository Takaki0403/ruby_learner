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

    desc 'sequential_check [section:1~11] [part:1~]','learning drill'
    map "-s" => "sequential_check"
    option :next, aliases: :n, type: :boolean
    option :drill, aliases: :d, type: :boolean
    option :last, aliases: :l, type: :boolean
    def sequential_check(*args)
      begin
        sequential_main = SequentialMain.new(@gem_dir, @local_dir)
        if args[0] == '-p'
          pair_timer = PairTimer.new do
            pair_timer.popup_per_time(10)
          end
          args[0] = args[1]
          args[1] = args[2]
        end

        if options[:drill]
          Thread.kill(pair_timer) if pair_timer != nil
          sequential_main.drill_contents
        elsif options[:next]
          final_sec, final_par = sequential_main.get_final_history()
          next_sec, next_par = sequential_main.get_next_question(final_sec, final_par)
          sequential_main.action(next_sec, next_par)
        elsif options[:last]
          sequential_main.last_re_action()
        else
          sequential_main.action(args[0], args[1])
        end
        Thread.kill(pair_timer) if pair_timer != nil
      rescue => error
        puts "Error.message: #{error.message}"
        puts 'sequential_check has 5-modes'
        puts 'mode-1: $ sequential_check [section:1~11] [part:1~], ex) sequential_check 1 3'
        puts 'mode-2: $ sequential_check -d, check drill contents'
        puts 'mode-3: $ sequential_check -n, learn next to your last-question'
        puts 'mode-4: $ sequential_check -l, learn your last-question'
        puts 'mode-5: $ sequential_check -p [1 2, -d, -n, -l], learn with partner'
      end
    end

    desc 'restore','check your restore'
    option :refresh, aliases: :r, type: :boolean
    def restore(*args)
      restores = []
      dir = Dir.open(@restore_dir)
      dir.each do |file|
        if file != '.' && file != '..' && file != '.empty.rb'
          restores << file.slice(1..file.length)
        end
      end
      sorted_restores = restores.sort_by{|item| item.to_i}
      sorted_restores.each{|item| item.insert(0, "[")}
      if options[:refresh]
        system("rm -rf #{@restore_dir}")
        system("mkdir #{@restore_dir}")
      elsif args.empty? == true
        if sorted_restores.size < 20
          puts sorted_restores
        else
          system("ls #{@restore_dir}")
          puts "\nlast 5 restore history."
          puts sorted_restores[-5..-1], "\n"
        end
        puts "If you want to open a restore_file, you execute 'ruby_learner restore [number]'"
        puts "ex) ruby_learner restore 3"
        print "If you want to remove all restore_files, you execute 'ruby_learner restore -r'"
      else
        case args[0].to_i
        when 0..sorted_restores.size-1
          filename = sorted_restores[args[0].to_i]
          system("emacs #{@restore_dir}/#{filename}")
        else
          puts "you have #{sorted_restores.size} restore_files."
          puts "you must put 'ruby_learner restore 0~#{sorted_restores.size - 1}.'"
        end
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
