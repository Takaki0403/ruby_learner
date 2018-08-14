# section_8/part_1/answer.rb
# 8-1-match.rb
n = /#{ARGV[0]}/

if n =~ 'Hello, Ruby.'
  print "match.\n"
else
  print "not match.\n"
end
