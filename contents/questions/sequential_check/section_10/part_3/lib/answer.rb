# section_10/part_3/answer.rb
# 10-3-file-write.rb
filename = STDIN.gets.chomp

file = File.open(filename, 'w+')
file.puts('Hello, Ruby.')
file.close

puts File.read(filename)
