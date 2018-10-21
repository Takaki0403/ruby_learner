class PairTime < Thread
  def popup_per_time(time)
      sleep time
      system("osascript -e 'tell app \"System Events\" to display dialog \"Hello World\"'")
      system('afplay /System/Library/Sounds/Submarine.aiff')
    end
  end

end
