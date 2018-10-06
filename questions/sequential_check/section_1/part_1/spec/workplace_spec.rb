require "open3"

RSpec.describe "section-1, part-1" do
  it "return 'Hello, Ruby.'" do
    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb")
    expect { print stdout }.to output('Hello, Ruby.').to_stdout
  end
end
