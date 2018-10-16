# section_9/part_1/answer.rb
# 9-1-regular-exp.rb
str = STDIN.gets.chomp
regular_exp = /Hello/ =~ str

if regular_exp
  puts regular_exp
else
  puts 'not match.'
end
