# -*- coding: utf-8 -*-
# section_2/answer.rb

puts "please input country"
country = gets.chomp

def agreement(country)
  if country == 'japan'
    puts 'こんにちは'
  elsif country == 'us'
    puts 'hello'
  else
    puts '???'
  end
end

# agreement(country)
