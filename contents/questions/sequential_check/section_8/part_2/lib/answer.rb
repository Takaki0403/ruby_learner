# section_8/part_2/answer.rb
# 8-2-class.rb
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
