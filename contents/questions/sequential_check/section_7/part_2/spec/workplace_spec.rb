# -*- coding: utf-8 -*-
require "open3"

filename = "#{ENV['HOME']}/.ruby_learner/workshop/lib/workplace.rb"

RSpec.describe "def-check" do
  it 'given tanaka, return "Hello, tanaka.\n"' do
    allow(STDIN).to receive(:gets) { "Ruby" }
    require "#{ENV['HOME']}/.ruby_learner/workshop/lib/workplace.rb"
    expect { hello("tanaka") }.to output("Hello, tanaka.\n").to_stdout
  end
  it 'given kitaro\n, return "Hello, kitaro.\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{filename}",:stdin_data=>"kitaro\n")
    expect { puts stdout }.to output("Hello, kitaro.\n").to_stdout
  end
end
