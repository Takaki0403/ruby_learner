require "open3"

workplace = "#{ENV['HOME']}/.ruby_learner/workshop/lib/workplace.rb"

RSpec.describe "STDIN-check" do
  it 'given 3\n6\n9\n, return "3\n6\n9\n[3, 6, 9]\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{workplace}", :stdin_data=>"3\n6\n9\n")
    expect { puts stdout }.to output("3\n6\n9\n[\"3\\n\", \"6\\n\", \"9\\n\"]\n").to_stdout
  end
  it 'given fizz\nbuzz\n, return "fizz\nbuzz\n[\"fizz\\n\", \"buzz\\n\"]\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{workplace}", :stdin_data=>"fizz\nbuzz\n")
    expect { puts stdout }.to output("fizz\nbuzz\n[\"fizz\\n\", \"buzz\\n\"]\n").to_stdout
  end
end
