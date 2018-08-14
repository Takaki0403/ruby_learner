# section_11/part_2/answer.rb
# 11-2-require-date.rb
require 'date'

days = Date.today - Date.new(1993, 2, 24)
puts days.to_i
