# -*- coding: utf-8 -*-
require "open3"

workshop = "#{ENV['HOME']}/.ruby_learner/workshop"

RSpec.describe "regular-exp-check" do
  it 'given "R8uby, Hello\n", return "match\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb", :stdin_data=>"R8uby, Hello\n")
    expect { puts stdout }.to output("match.\n").to_stdout
  end
  it 'given "A9 is Hello\n", return "match\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb", :stdin_data=> "A9 is Hello\n")
    expect { puts stdout }.to output("match.\n").to_stdout
  end
  it 'given "Ruby, tanaka\n", return "not match\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb", :stdin_data=>"Ruby, tanaka\n")
    expect { puts stdout }.to output("not match.\n").to_stdout
  end
end
