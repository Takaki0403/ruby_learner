# -*- coding: utf-8 -*-
require "open3"

RSpec.describe "ARGV-check" do
  it 'given 3 "for-read.txt", return 4' do
    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb", :stdin_data=>"#{workshop}/lib/mk-read.txt")
    expect { puts stdout }.to output("Hello, Ruby.\n").to_stdout
  end
end
