require "open3"

RSpec.describe "times-loop" do
  it '5times, return "All work and no play makes Jack a dull boy.\n" x 5 ' do
    workshop = "#{ENV['HOME']}/ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb")
    expect { puts stdout }.to output("All work and no play makes Jack a dull boy.\nAll work and no play makes Jack a dull boy.\nAll work and no play makes Jack a dull boy.\nAll work and no play makes Jack a dull boy.\nAll work and no play makes Jack a dull boy.\n").to_stdout
  end
end
