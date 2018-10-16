# section_9/part_3/answer.rb
# 9-3-regular-exp.rb
str = STDIN.gets.chomp
regular_exp = /^[A-Z][0-9]/ =~ str

if regular_exp
  puts 'match.'
else
  puts 'not match.'
end
