require "open3"

RSpec.describe "symbol-check" do
  it 'given 2, return ":"2""' do
    workshop = "#{ENV['HOME']}/ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 2")
    expect { puts stdout }.to output(":\"2\"\n").to_stdout
  end
  it 'given "hoge", return ":hoge"' do
    workshop = "#{ENV['HOME']}/ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb hoge")
    expect { puts stdout }.to output(":hoge\n").to_stdout
  end
end
