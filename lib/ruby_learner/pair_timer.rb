require 'open3'

class PairTimer < Thread
  def popup_per_time(time)
     loop do
      sleep time
      system('afplay /System/Library/Sounds/Submarine.aiff')
      o, e, s = Open3.capture3("osascript -e 'tell app \"System Events\" to display dialog \"#{time}s passed.\"'")

      if o != "button returned:OK\n"
        puts 'pair timer is stopped.'
        Thread.kill(self)
      end
    end
  end
end
