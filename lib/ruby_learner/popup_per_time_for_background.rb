require 'open3'

time = ARGV[0].to_i

loop do
  sleep time
  system('afplay /System/Library/Sounds/Submarine.aiff')
  o, e, s = Open3.capture3("osascript -e 'tell app \"System Events\" to display dialog \"#{time}s passed.\nPut cancel to stop pair-mode.\nPut OK to continue pair-mode.\"'")
  
  if o != "button returned:OK\n"
    Open3.capture3("osascript -e 'tell app \"System Events\" to display dialog \"pair_popup_mode is stopped.\"'")
    break
  end
end
