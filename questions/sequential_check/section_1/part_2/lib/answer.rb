# 1.2-agreement.rb

puts "please input country"
country = gets.chomp

def agreement(country)
  if country == 'japan'
    return 'こんにちは'
  elsif country == 'us'
    return 'hello'
  else
    return '???'
  end
end

# agreement(country)
