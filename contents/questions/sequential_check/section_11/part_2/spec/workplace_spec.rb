# -*- coding: utf-8 -*-
require "open3"
require 'date'

days = Date.today - Date.new(1993, 2, 24)

RSpec.describe "ARGV-check" do
  it 'given "tanaka", return "Hello, tanaka.\n"' do
    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb")
    expect { puts stdout }.to output("#{days.to_i}\n").to_stdout
  end
end
