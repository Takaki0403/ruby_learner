require "open3"

RSpec.describe "ARGV-check" do
  it 'given 9, return "smaller\n"' do
    workshop = "#{ENV['HOME']}/ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 9")
    expect { puts stdout }.to output("smaller\n").to_stdout
  end
  it 'given 10, return "greater\n"' do
    workshop = "#{ENV['HOME']}/ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 10")
    expect { puts stdout }.to output("greater\n").to_stdout
  end
end
