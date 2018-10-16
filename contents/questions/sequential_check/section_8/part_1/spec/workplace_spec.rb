# -*- coding: utf-8 -*-
require "open3"
require "#{ENV['HOME']}/.ruby_learner/workshop/lib/workplace.rb"

is_instance_method = false
is_stdout_method = false
filename = "#{ENV['HOME']}/.ruby_learner/workshop/lib/workplace.rb"

RSpec.describe "class-check" do
  it 'chesk Hello class contents' do
    hello = Hello.new('sasaki')
    expect{ hello.stdout }.to output("Hello, sasaki.\n").to_stdout
  end

  it 'check instance-method, return boolean' do
    File.open(filename, "r") do |file|
      file.each_line do |line|
        is_instance_method = true if line.include?('Hello.new')
        is_stdout_method = true if line.include?('.stdout')
      end
    end

    puts "ErrorMessage: you don't use class.new--methods．" if !is_instance_method
    puts "ErrorMessage: you don't use class.stdout--methods．" if !is_stdout_method
 
    expect( is_instance_method ).to eq(true)
    expect( is_stdout_method ).to eq(true)
   end

  it "given 'tanaka', return Hello, tanaka.\\n" do
        stdout, stderr, status = Open3.capture3("ruby #{filename}")
    expect { puts stdout }.to output("Hello, tanaka.\n").to_stdout
  end
end
