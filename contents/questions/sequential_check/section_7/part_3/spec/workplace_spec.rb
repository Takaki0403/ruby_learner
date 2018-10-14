# -*- coding: utf-8 -*-
require "open3"
require "#{ENV['HOME']}/.ruby_learner/workshop/lib/workplace.rb"

filename = "#{ENV['HOME']}/.ruby_learner/workshop/lib/workplace.rb"

RSpec.describe "def-check" do
  it 'given [1, 2, 3], return 6' do
    expect ( average([1, 2, 3]) ).to eq(6)
  end
  it 'return 240' do
    stdout, stderr, status = Open3.capture3("ruby #{filename}")
    expect { puts stdout }.to output(240).to_stdout
  end
end
