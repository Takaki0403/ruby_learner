# section_8/part_1/answer.rb
# 8-1-class.rb
class Hello
  def initialize(name)
    @name = name
  end

  def stdout
    puts "Hello, #{@name}."
  end
end

hello = Hello.new('tanaka')
hello.stdout
