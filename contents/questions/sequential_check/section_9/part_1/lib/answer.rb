# section_9/part_1/answer.rb
# 9-1-regular-exp.rb
str = STDIN.gets.chomp

if regular_exp = /Hello/ =~ str
  puts regular_exp
else
  puts 'not match.'
end
