require "open3"

RSpec.describe "array-check" do
  it 'return "表面積=76\n体積=40\n"' do
    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb")
    expect { puts stdout }.to output("[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]\n").to_stdout
  end
end
