require 'benchmark'
require_relative './search/search.rb'
require_relative './sort/sort.rb'

aim = rand(5000..16000)
nums = [*1..20000]
# p aim = rand(12)
# nums = 10000.times.map{rand(12)}.sort

puts "aim: #{aim}"
puts "nums.size: #{nums.size}"

puts "\nSearch"
search = Search.new(nums, aim)
hashes = search.hash_init(nums)
result = Benchmark.realtime do
  hit = search.hash_search(hashes)
end
puts "処理概要: hash #{result}s"

result = Benchmark.realtime do
  hit = search.linear_search
end
puts "処理概要: linear #{result}s"

result = Benchmark.realtime do
  hit = search.binary_search
end
puts "処理概要: binary #{result}s"


puts "\nSort"
nums = 1000.times.map{|x| x=rand(100)}
result = Benchmark.realtime do
  sort = Sort.allocate.selective_sort(nums.clone)
end
puts "処理概要: selective #{result}s"

result = Benchmark.realtime do
  sort = Sort.allocate.bubble_sort(nums.clone)
end
puts "処理概要: bubble #{result}s"

result = Benchmark.realtime do
  sort = Sort.allocate.insert_sort(nums.clone)
end
puts "処理概要: insert #{result}s"

result = Benchmark.realtime do
  sort = Sort.allocate.quick_sort(nums.clone, 0, nums.size-1)
end
puts "処理概要: quick #{result}s"
