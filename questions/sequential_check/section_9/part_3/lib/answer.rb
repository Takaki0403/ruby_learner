# -*- encoding: utf-8 -*-
# section_9/part_3/answer.rb
# 9-3-pattern.rb
pattern = Regexp.new(ARGV[0])
filename = ARGV[1]

file = File.open(filename)
file.each_line do |line|
  if pattern =~ line
    print line
  end
end
file.close
