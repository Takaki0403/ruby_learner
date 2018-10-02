require "open3"

$stdin = StringIO.new(1.5)

RSpec.describe "ARGV-check" do
  it 'given 1 4, return "5\n-3\n4\n0\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb")
    expect { puts stdout }.to output("1.5").to_stdout
  end
#  it 'given 20 4, return "24\n16\n80\n5\n"' do
#    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
#    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 20 4")
 #   expect { puts stdout }.to output("24\n16\n80\n5\n").to_stdout
#  end
end
