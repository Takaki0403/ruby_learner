# section_1/workplace.rb

repeat_count = ARGV[0].to_i
 math_num = ARGV[1].to_i

def for_system(a, b)
  answer = 0
  for i in 0..b do
    answer = answer + a
  end
  return answer
end

 a = for_system(repeat: repeat_count, math: math_num)
# puts a
