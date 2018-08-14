# section_9/part_2/answer.rb
# 9-2-file-open.rb
filename = ARGV[0]
file = File.open(filename)
file.each_line do |line|
  print line
end
