# section_10/part_2/answer.rb
# 10-2-file-open.rb
filename = STDIN.gets.chomp
file_texts = []
file = File.open(filename)
file.each_line do |line|
  file_texts << line
end
file.close
puts file_texts[0]
puts file_texts[2]
