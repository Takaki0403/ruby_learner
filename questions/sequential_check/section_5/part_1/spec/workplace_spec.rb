require "open3"

RSpec.describe "ARGV-check" do
  it 'given 3, return "1\n2\n3\n"' do
    workshop = "#{ENV['HOME']}/ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 3")
    expect { puts stdout }.to output("1\n2\n3\n").to_stdout
  end
  it 'given 5, return "1\n2\n3\n4\n5\n"' do
    workshop = "#{ENV['HOME']}/ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 5")
    expect { puts stdout }.to output("1\n2\n3\n4\n5\n").to_stdout
  end
end
