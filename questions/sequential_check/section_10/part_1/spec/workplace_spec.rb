# -*- coding: utf-8 -*-
require "open3"

RSpec.describe "def-check" do
  it 'return "Hello, Ruby.\n"' do
    workshop = "#{ENV['HOME']}/ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb")
    expect { puts stdout }.to output("Hello, Ruby.\n").to_stdout
  end
end
