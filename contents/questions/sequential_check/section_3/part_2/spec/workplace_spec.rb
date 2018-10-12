require "open3"
require "#{ENV['HOME']}/.ruby_learner/workshop/lib/workplace.rb"

RSpec.describe "STDIN-check" do
  it 'given [3, 6, 9], return "3\n6\n9\n[3, 6, 9]\n"' do
    allow(STDIN).to receive(:readlines) { [3, 6, 9] }
    expect { standard_input() }.to output("3\n6\n9\n[3, 6, 9]\n").to_stdout
  end
  it 'given ["fizz", "buzz"], return "fizz\nbuzz\n[\"fizz\\n\", \"buzz\\n\"]\n"' do
    allow(STDIN).to receive(:readlines) { ["fizz\n", "buzz\n"] }
    expect { standard_input() }.to output("fizz\nbuzz\n[\"fizz\\n\", \"buzz\\n\"]\n").to_stdout
  end
end
