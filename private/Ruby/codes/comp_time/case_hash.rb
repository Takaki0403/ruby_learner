require 'benchmark'
check = 1000000
str_nums = %i(zero one two three four five six seven eight nine)

class Test
  def initialize
    @gl_hash = {"zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9}
  end
  def case_method(item)
    result = nil
    case item
    when :zero
      result = 0
    when :one
      result = 1
    when :two
      result = 2
    when :three
      result = 3
    when :four
      result = 4
    when :five
      result = 5
    when :six
      result = 6
    when :seven
      result = 7
    when :eight
      result = 8
    when :nine
      result = 9
    else
      result = nil
    end
    result
  end
  def hash_method1(item)
    hash = {"zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9}
    hash[item]
  end
  def hash_method2(item)
    @gl_hash[item]
  end
end
test = Test.new
case_time = Benchmark.realtime do
  check.times do
    test.case_method(str_nums.sample)
  end
end
puts "case_time: #{case_time}s"

hash_time1 = Benchmark.realtime do
  check.times do
    test.hash_method1(str_nums.sample)
  end
end
puts "hash_time1: #{hash_time1}s"

hash_time2 = Benchmark.realtime do
  check.times do
    test.hash_method2(str_nums.sample)
  end
end
puts "hash_time2: #{hash_time2}s"
