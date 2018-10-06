require "open3"

RSpec.describe "array-check" do
  it 'return "表面積=76\n体積=40\n"' do
    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb")
    expect { puts stdout }.to output('[7, 2, 4, 9, 10, 1, 5, 8, 6, 3]').to_stdout
  end
end
