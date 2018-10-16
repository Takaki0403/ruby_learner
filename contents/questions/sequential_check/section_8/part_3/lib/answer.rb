# section_8/part_3/answer.rb
# 8-3-class.rb
class Hello
  def initialize(name)
    @name = name
  end

  def stdout
    puts "Hello, #{@name}."
  end
end

class AccessHello < Hello
  attr_writer :name
end

access_hello = AccessHello.new('tanaka')
access_hello.stdout
access_hello.name = 'nakata'
access_hello.stdout
