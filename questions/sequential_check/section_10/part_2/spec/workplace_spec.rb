# -*- coding: utf-8 -*-
require "open3"

RSpec.describe "def-check" do
  it 'given "yamada" and "taro", return "Hello, yamada.\nHello, taro.\n"' do
    workshop = "#{ENV['HOME']}/ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb yamada taro")
    expect { puts stdout }.to output("Hello, yamada.\nHello, taro.\n").to_stdout
  end
  it 'given "tanaka" and "goro", return "Hello, tanaka.\nHello, goro.\n"' do
    workshop = "#{ENV['HOME']}/ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb tanaka goro")
    expect { puts stdout }.to output("Hello, tanaka.\nHello, goro.\n").to_stdout
  end
end
