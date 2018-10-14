# section_7/part_3/answer.rb
# 7-3-def.rb
nums = [20, 40, 80, 100]

def average(array)
  result = 0
  array.each do |item|
    result += item
  end
end

puts average(nums)
