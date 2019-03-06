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

nums = 10.times.map{|x| x=rand(100)}
sorted = bubble_sort(nums)
p "nums: #{nums}"
p "sorted: #{sorted}"
