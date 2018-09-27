require "open3"

RSpec.describe "ARGV-check" do
  it 'given 0 3 2 0 4, return "0\n3\n2\n0\n4\n"' do
    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 0 3 2 0 4")
    expect { puts stdout }.to output("0\n3\n2\n0\n4\n").to_stdout
  end
  it 'given 10 0 0 2 1, return "10\n0\n0\n2\n1\n"' do
    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 10 0 0 2 1")
    expect { puts stdout }.to output("10\n0\n0\n2\n1\n").to_stdout
  end
end
