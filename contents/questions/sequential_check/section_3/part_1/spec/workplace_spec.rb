require "open3"

RSpec.describe "ARGV-check" do
  it 'given 2 4 5, return "表面積=76\n体積=40\n"' do
    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 2 4 5")
    expect { puts stdout }.to output("surface_area=76\nvolume=40\n").to_stdout
  end
  it 'given 20 4 13, return "表面積=784\n体積=1040\n"' do
    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 20 4 13")
    expect { puts stdout }.to output("surface_area=784\nvolume=1040\n").to_stdout
  end
end
