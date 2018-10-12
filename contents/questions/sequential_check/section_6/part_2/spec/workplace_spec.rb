require "open3"

RSpec.describe "ARGV-check" do
  it 'given 2, return [2, 1, 4, 1, 5]' do
    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 2")
    expect { puts stdout }.to output("[2, 1, 4, 1, 5]\n").to_stdout
  end
  it 'given 4, return 5' do
    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 4")
    expect { puts stdout }.to output("[4, 1, 4, 1, 5]\n").to_stdout
  end
end
