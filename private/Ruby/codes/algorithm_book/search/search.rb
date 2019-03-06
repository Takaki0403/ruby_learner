class Search
  def initialize(nums, aim)
    @nums = nums
    @aim = aim
  end
  def linear_search
    @nums.each_with_index do |item, index|
      return index if @aim == item
    end
  end
  
  def binary_search
    nums_head = 0
    nums_tail = @nums.size - 1
    while nums_head <= nums_tail
      nums_center = (nums_tail + nums_head) / 2
      case @nums[nums_center] <=> @aim
      when -1
        nums_head += 1
      when 0
        return nums_center
      else
        nums_tail -= 1
      end
    end
  end
  
  def hash_init(nums)
    hashes = []
    hashes = Array.new(nums.size * 1.7, 0)
    nums.each do |num|
      k = num % hashes.size
      hashes.size.times do
        break if hashes[k] == 0
        k = (k+1) % hashes.size
      end
      hashes[k] = num
    end
    hashes
  end

  def hash_search(hashes)
    k = @aim % hashes.size
    hashes.size.times do
      case hashes[k]
      when 0
        return nil
      when @aim
        return k
      else
        k = (k+1) % hashes.size
      end
    end
  end
end

=begin
p nums = [12, 25, 36, 20, 30, 8, 42]
aim = 36
search = Search.new(nums, aim)
hit = search.hash_search
p "aim: #{aim}, hit: #{hit}"
=end
