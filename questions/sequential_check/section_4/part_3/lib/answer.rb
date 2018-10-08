# section_4/part_3/answer.rb
# 4-3-case.rb
def gree()
  country = STDIN.gets.chomp
  case country
  when 'Japan' then
    puts 'こんにちは'
  when 'USA' then
    puts 'Hello'
  else
    print 'else'
  end
end
