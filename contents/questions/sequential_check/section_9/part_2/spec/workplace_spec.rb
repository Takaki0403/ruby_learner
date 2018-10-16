# -*- coding: utf-8 -*-
require "open3"

workshop = "#{ENV['HOME']}/.ruby_learner/workshop"

RSpec.describe "regular-exp-check" do
  it 'given "Ruby, AAB Hello\n", return "match A*B.\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb", :stdin_data=>"Ruby, AAB Hello\n")
    expect { puts stdout }.to output("match A*B.\n").to_stdout
  end
  it 'given "taBnaka, Hello\n", return "match A*B.\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb", :stdin_data=> "taBnaka, Hello\n")
    expect { puts stdout }.to output("match A*B.\n").to_stdout
  end
  it 'given "Ruby, tanaka\n", return "not match\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb", :stdin_data=>"Ruby, tanaka\n")
    expect { puts stdout }.to output("not match.\n").to_stdout
  end
end
