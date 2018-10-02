require "open3"
require "#{ENV['HOME']}/.ruby_learner/workshop/lib/workplace.rb"

RSpec.describe "STDIN-check" do
  it 'given 3, return "3.0\n9.0\n"' do
    allow(STDIN).to receive(:gets) { 3 }
    expect { standard_input() }.to output("3.0\n9.0\n").to_stdout
  end
  it 'given 8, return "8.0\n64.0\n"' do
    allow(STDIN).to receive(:gets) { 8 }
    expect { standard_input() }.to output("8.0\n64.0\n").to_stdout
  end
end
