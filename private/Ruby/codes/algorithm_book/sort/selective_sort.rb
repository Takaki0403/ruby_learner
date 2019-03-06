def selective_sort(nums)
  sorts = nums.clone
  min_index = get_min_index(sorts, 0)
  for i in 0...sorts.size-1
    min_index = get_min_index(sorts, i)
    sorts[i], sorts[min_index] = sorts[min_index], sorts[i]
  end
  return sorts
end

def get_min_index(nums, start)
  return nil if start >= nums.size
  min_index = start
  for check in start...nums.size
    min_index = check if nums[check] < nums[min_index]
  end
  return min_index
end

nums = 10.times.map{|x| x=rand(100)}
sorted = selective_sort(nums)
p "nums: #{nums}"
p "sorted: #{sorted}"
