def eratosthenes_sieve(num)
  # nums = Array.new(num, true)
  nums = [*0...num]
  primes = []
  k = 2 # 0, 1 aren't  prime-nums
  while k*k<=num
    for i in k..num/k
      nums[k*i] = nil
    end
    k += 1
    while !nums[k]
      k += 1
    end
  end
=begin
  primes = nums.each_with_index.select {|num, index| index if num}
  primes.clone.each_with_index do |prime, index|
    primes[index] = prime[1]
  end
  primes
=end
  nums.compact[2...nums.size]
end

num = rand(100)
prime_nums = eratosthenes_sieve(num)
p "num: #{num}"
p "prime_nums: #{prime_nums}"
