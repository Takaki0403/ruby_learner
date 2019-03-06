class Sort
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
  
  def bubble_sort(nums)
    sorts = nums.clone
    for k in 0...sorts.size-1
      # confirm minimum nums from sorts.start
      (sorts.size-1).step(k+1, -1) do |i|
        # comparing 2nums from sorts.last
        sorts[i-1], sorts[i] = sorts[i], sorts[i-1] if sorts[i-1] > sorts[i]
      end
    end
    return sorts
  end
  
  def insert_sort(nums)
    sorts = nums.clone
    for i in 1...sorts.size
      # confirm minimum nums from sorts.start+1
      check = sorts[i].clone
      k = i
      while k>0 && sorts[k-1]>check
        # shift sorts[k-1] to k if sorts[k-1] greater than check
        sorts[k] = sorts[k-1]
        k -= 1
      end
      sorts[k] = check
    end
    return sorts
  end
  
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
end
