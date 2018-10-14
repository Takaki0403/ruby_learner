require "open3"

workplace = "#{ENV['HOME']}/.ruby_learner/workshop/lib/workplace.rb"

RSpec.describe "STDIN-check" do
  it 'given 3\n, return "3.0\n9.0\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{workplace}", :stdin_data=>"3\n")
    expect { puts stdout }.to output("3.0\n9.0\n").to_stdout
  end
  it 'given 8\n, return "8.0\n64.0\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{workplace}", :stdin_data=>"8\n")
    expect { puts stdout }.to output("8.0\n64.0\n").to_stdout
  end
end
