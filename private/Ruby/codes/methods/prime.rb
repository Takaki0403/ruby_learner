def is_prime?(num)
  is_prime = false
  return true if num <= 2
  for item in 2...Math.sqrt(num)
    if num%item != 0
      is_prime = true
    else
      return false
    end
  end
  return is_prime
end

puts num = rand(3..100)
puts 'is_prime?'
puts is_prime?(num)
