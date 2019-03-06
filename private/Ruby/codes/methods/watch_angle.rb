def watch_angle(hour, minute)
  hour_angle = hour.to_f * (360 / 12)
  minute_angle = minute.to_f * (360 / 60)
  hour_angle += (360 / 12) * (minute_angle / 360)
  hour_angle -= 360 if hour_angle > 360
  return hour_angle, minute_angle
end

def angle_diff(angle0, angle1)
  diff = (angle0 - angle1).abs
  diff = 360 - diff if diff > 180
  diff
end

hour = rand(1..12) # short
minute = rand(1..60) # long
hour_angle, minute_angle = watch_angle(hour, minute)
puts "hour: #{hour}"
puts "minute: #{minute}"
puts "angle [hour, minute]: [#{hour_angle}, #{minute_angle}]"
puts "angle_diff: #{angle_diff(hour_angle, minute_angle)}"
