# section_5/part_2/answer.rb
# 5-3-loop.rb
names = %w[tanaka nakamura sasaki suzuki]
index = 0

names.size.times do
  puts names[index]
  index += 1
end
# add your code.
index = 0

loop do
  puts names[index]
  index += 1
  break if index >= names.size
end
