require "open3"
require "#{ENV['HOME']}/.ruby_learner/workshop/lib/workplace.rb"

RSpec.describe "STDIN-check" do
  filename = "#{ENV['HOME']}/.ruby_learner/workshop/lib/workplace.rb"
  check-method = false
  it 'check case-method, return boolean' do
    File.open(filename, "r") do |file|
      file.each_line do |line|
        check-method = true if line =~ 'case'
      end
    end
    expect { check-method }.to output(true)
  end
  it 'given Japan, return "こんにちは\n"' do
    allow(STDIN).to receive(:gets) { "japan\n" }
    expect { gree() }.to output("こんにちは\n").to_stdout
  end
  it 'given USA, return "Hello\n"' do
    allow(STDIN).to receive(:gets) { "USA\n" }
    expect { gree() }.to output("Hello\n").to_stdout
  end
  it 'given Italy, return "else\n"' do
    allow(STDIN).to receive(:gets) { "Italy\n" }
    expect { gree() }.to output("else\n").to_stdout
  end
end
