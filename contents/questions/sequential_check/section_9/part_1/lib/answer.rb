# section_9/part_1/answer.rb
# 9-1-regular-exp.rb
str = '3A2B1CHelloD4E5F6'

if regular_exp = /Hello/ =~ str
  puts regular_exp
else
  puts 'not match'
end
