# -*- coding: utf-8 -*-
require "open3"

RSpec.describe "ARGV-check" do
  it 'given "tanaka", return "Hello, tanaka.\n"' do
    workshop = "#{ENV['HOME']}/ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 'tanaka'")
    expect { puts stdout }.to output("Hello, tanaka.\n").to_stdout
  end
  it 'given "yamada", return "Hello, yamada.\n"' do
    workshop = "#{ENV['HOME']}/ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 'yamada'")
    expect { puts stdout }.to output("Hello, yamada.\n").to_stdout
  end
end
