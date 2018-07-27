# section_1/workplace.rb

puts repeat_count = ARGV[0].to_i
puts math_num = ARGV[1].to_i

def for_system(repeat: a, math: b)
  answer = 0
  for i in 0..repeat do
    answer = answer + math
  end
  return answer
end

a = for_system(repeat: repeat_count, math: math_num)
puts a
