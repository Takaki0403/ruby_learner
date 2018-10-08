require "open3"

RSpec.describe "TrueAndFalse-check" do
  workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
  it 'return "true\nfalse\nfalse\true\ntrue\ntrue\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb")
    expect { print "#{stdout}" }.to output("true\nfalse\nfalse\true\ntrue\ntrue\n").to_stdout
  end
end
