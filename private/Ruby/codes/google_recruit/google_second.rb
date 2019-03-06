def is_prime(num)
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

def gets_ten_char(text)
  num_str = text.delete('.').chomp
  nums_int = []
  for item in 0...num_str.length-9
    nums_int << num_str[item..item+9].to_i
  end
  return nums_int
end

def char_sum(ten_num)
  sum = 0
  ten_str = ten_num.to_s
  for index in 0...ten_str.length
    sum += ten_str[index].to_i
  end
  return sum
end

e_text = File.read('./google_e.txt')
ten_nums = gets_ten_char e_text
each_count = 0
ten_nums.each do |ten_num|
  if char_sum(ten_num) == 49
    print each_count, ":\t", ten_num, "\n"
  end
  each_count += 1
end
