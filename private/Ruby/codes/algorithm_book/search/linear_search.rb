def linear_search(nums, aim)
  nums.each_with_index do |item, index|
    return index if aim == item
  end
end

nums = [5, 3, 7, 4, 6]
aim = 7
hit = linear_search(nums, aim)
p "nums: #{nums}" # "nums: [5, 3, 7, 4, 6]"
p "aim: #{aim}, index: #{hit}" # "aim: 7, index: 2"
