require "open3"

RSpec.describe "hash_methods-size" do
  it 'put some datas' do
    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb")
    expect { puts stdout }.to output("[:sasaki, :minami, :tanaka]\n[21, 18, 32]\n[[:sasaki, 21], [:minami, 18], [:tanaka, 32]]\n").to_stdout
  end
end
