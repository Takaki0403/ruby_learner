require "open3"
require "#{ENV['HOME']}/.ruby_learner/workshop/lib/workplace.rb"

filename = "#{ENV['HOME']}/.ruby_learner/workshop/lib/workplace.rb"
check_method = false

RSpec.describe "STDIN-check" do
  it 'check case-method, return boolean' do
    File.open(filename, "r") do |file|
      file.each_line do |line|
        check_method = true if line.include?('case')
      end
    end
    puts "Message: you don't use case-methods．" if !check_method
    expect( check_method ).to eq(true)
  end
  it 'given Japan, return "こんにちは\n"' do
    allow(STDIN).to receive(:gets) { "Japan\n" }
    expect { gree() }.to output("こんにちは\n").to_stdout
  end
  it 'given USA, return "Hello\n"' do
    allow(STDIN).to receive(:gets) { "USA\n" }
    expect { gree() }.to output("Hello\n").to_stdout
  end
  it 'given Italy, return "else\n"' do
    allow(STDIN).to receive(:gets) { "Italy\n" }
    expect { gree() }.to output("else").to_stdout
  end
end
