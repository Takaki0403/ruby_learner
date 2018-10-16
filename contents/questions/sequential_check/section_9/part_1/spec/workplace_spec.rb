# -*- coding: utf-8 -*-
require "open3"

workshop = "#{ENV['HOME']}/.ruby_learner/workshop"

RSpec.describe "regular-exp-check" do
  it 'return "6\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb", :stdin_data=>"Ruby, Hello\n")
    expect { puts stdout }.to output("6\n").to_stdout
  end
  it 'return "8\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb", :stdin_data=> "tanaka, Hello\n")
    expect { puts stdout }.to output("8\n").to_stdout
  end
  it 'return "not match\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb", :stdin_data=>"Ruby, Hello\n")
    expect { puts stdout }.to output("not match.\n").to_stdout
  end
end
