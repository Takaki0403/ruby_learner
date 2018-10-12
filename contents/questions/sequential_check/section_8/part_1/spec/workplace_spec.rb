# -*- coding: utf-8 -*-
require "open3"

RSpec.describe "match-check" do
  it "given 'Hello, Ruby.', return \"match.\\n\"" do
    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 'Hello, Ruby.'")
    expect { puts stdout }.to output("match.\n").to_stdout
  end
  it 'given "hogehoge", return "表面積=784\n体積=1040\n"' do
    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 'hogehoge'")
    expect { puts stdout }.to output("not match.\n").to_stdout
  end
end
