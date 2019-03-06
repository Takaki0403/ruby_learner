def binary_search(nums, aim)
  nums_head = 0
  nums_tail = nums.size - 1
  while nums_head <= nums_tail
    nums_center = (nums_tail + nums_head) / 2
    case nums[nums_center] <=> aim
    when -1
      nums_head += 1
    when 0
      return nums_center
    else
      nums_tail -= 1
    end
  end
end

nums = [5, 3, 7, 4, 6].sort
aim = 7
hit = binary_search(nums, aim)
p "nums: #{nums}" # "nums: [3, 4, 5, 6, 7]"
p "aim: #{aim}, index: #{hit}" # "aim: 7, index: 4"
