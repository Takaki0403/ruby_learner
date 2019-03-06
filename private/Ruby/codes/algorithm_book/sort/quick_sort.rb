def quick_sort(nums, left, right)
  i = left + 1
  k = right
  while i<k
    while nums[i]<nums[left] && i<right
      i += 1
    end
    while nums[k]>=nums[left] && k>left
      k -= 1
    end
    nums[i], nums[k] = nums[k], nums[i] if i<k
  end
  nums[left], nums[k] = nums[k], nums[left] if nums[left]>nums[k]
  nums = quick_sort(nums, left, k-1) if left<k-1
  nums = quick_sort(nums, k+1, right) if right>k+1
  return nums
end

nums = 10.times.map{|x| x=rand(100)}
sorted = quick_sort(nums.clone, 0, nums.size-1)
p "nums: #{nums}"
p "sorted: #{sorted}"
