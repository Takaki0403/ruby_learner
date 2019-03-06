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

e_text = File.read('./google_e.txt')
ten_nums = gets_ten_char e_text
each_count = 0
ten_nums.each do |ten_num|
  case ten_num
  when 7182818284
    p each_count
    p ten_num
  when 8182845904
    p each_count
    p ten_num
  when 8747135266
    p each_count
    p ten_num
  else
  end
  if is_prime(ten_num)
    p each_count
    p ten_num
    break
  end
  each_count += 1
end
