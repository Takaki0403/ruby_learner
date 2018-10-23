# -*- coding: utf-8 -*-
require "open3"

RSpec.describe "ARGV-check" do

  is_require_method = false
  workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
  filename = "#{workshop}/lib/workplace.rb"
  it 'check require-method, return boolean' do
    File.open(filename, "r") do |file|
      file.each_line do |line|
        is_require_method = true if line.include?("require ")
      end
    end
    puts "ErrorMessage: you don't use require-method．" if !is_require_method

    expect( is_require_method ).to eq(true)
  end

  it 'given "tanaka", return "Hello, tanaka.\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{filename} 'tanaka'")
    expect { puts stdout }.to output("Hello, tanaka.\n").to_stdout
  end
  it 'given "yamada", return "Hello, yamada.\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{filename} 'yamada'")
    expect { puts stdout }.to output("Hello, yamada.\n").to_stdout
  end
end
