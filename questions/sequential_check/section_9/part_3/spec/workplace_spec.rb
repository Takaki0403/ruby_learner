# -*- coding: utf-8 -*-
require "open3"

RSpec.describe "ARGV-check" do
  it 'given 3 "for-read.txt", return 4' do
    workshop = "#{ENV['HOME']}/ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb 'ドンブラコ' #{workshop}/lib/for-read.txt")
    expect { puts stdout }.to output("おばあさんが川でせんたくをしていると、ドンブラコ、ドンブラコと、大きな桃が流れてきました。\n").to_stdout
  end
end
