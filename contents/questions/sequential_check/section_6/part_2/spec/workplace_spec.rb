require "open3"

workshop = "#{ENV['HOME']}/.ruby_learner/workshop"

RSpec.describe "hash-check" do
  it 'return {:name=>"tanaka", :age=>22}\n
       name: suzuki\n
       age: 22\n
       gender: man\n' do
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb")
    expect { puts stdout }.to output("{:name=>\"tanaka\", :age=>22}\nname: suzuki\nage: 22\ngender: man\n").to_stdout
  end
end
