require 'open3'

class PairTimer < Thread
  def popup_per_time_for_exe(time)
    loop do
      sleep time
      system('afplay /System/Library/Sounds/Submarine.aiff')
      o, e, s = Open3.capture3("osascript -e 'tell app \"System Events\" to display dialog \"#{time}s passed.\nPut cancel to stop pair-mode.\nPut OK to continue pair-mode.\"'")

      if o != "button returned:OK\n"
        puts 'pair timer is stopped.'
        Thread.kill(self)
      end
    end
  end

  def popup_per_time_for_non_exe(time)
    popup_file = File.expand_path("popup_per_time_for_background.rb", __FILE__)
    p popup_file
    system("ruby #{popup_file} #{time} &")
  end

end
