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
nums = 10.times.map{|x| x=rand(100)}
sorted = insert_sort(nums)
p "nums: #{nums}"
p "sorted: #{sorted}"
