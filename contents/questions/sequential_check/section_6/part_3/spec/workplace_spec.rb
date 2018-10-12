require "open3"

RSpec.describe "array-size" do
  it 'put some datas' do
    workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb")
    expect { puts stdout }.to output("[3, 1, 4, 1, 5]\n5\n").to_stdout
  end
end
