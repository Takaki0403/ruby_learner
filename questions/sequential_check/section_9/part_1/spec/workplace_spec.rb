require "open3"

RSpec.describe "ARGV-check" do
  it 'given "read.rb", return 4' do
    workshop = "#{ENV['HOME']}/ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 2")
    expect { puts stdout }.to output("4\n").to_stdout
  end
end
