# section_9/part_2/answer.rb
# 9-2-regular-exp.rb
str = STDIN.gets.chomp
regular_exp = /A*B/ =~ str

if regular_exp
  puts 'match A*B.'
else
  puts 'not match.'
end
