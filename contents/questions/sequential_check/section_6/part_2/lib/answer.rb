# section_6/part_2/answer.rb
# 6-2-hash.rb
address = { name: 'tanaka', age: 22 }

p address

address[:name] = 'suzuki'
address[:gender] = :man

address.each do |key, value|
  puts "#{key}: #{value}"
end
