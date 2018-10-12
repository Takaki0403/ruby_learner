require "open3"

is_each_method = false
workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
filename = "#{workshop}/lib/workplace.rb"

RSpec.describe "each-check" do
  it 'check each-method, return boolean' do
    File.open(filename, "r") do |file|
      file.each_line do |line|
        is_each_method = true if line.include?('each')
      end
    end
    puts "ErrorMessage: you don't use each-methods．" if !is_each_method
    expect( is_each_method ).to eq(true)
  end

  it 'return names-items' do
    stdout, stderr, status = Open3.capture3("ruby #{filename}")
    expect { puts stdout }.to output("tanaka\nnakamura\nsasaki\nsuzuki\ntanaka\nnakamura\nsasaki\nsuzuki\n").to_stdout
  end
end
