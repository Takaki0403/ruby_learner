require "open3"

is_loop_method = false
workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
filename = "#{workshop}/lib/workplace.rb"

RSpec.describe "loop-check" do
  it 'check loop-method, return boolean' do
    File.open(filename, "r") do |file|
      file.each_line do |line|
        is_loop_method = true if line.include?('loop')
      end
    end
    puts "ErrorMessage: you don't use loop-methods．" if !is_loop_method
    expect( is_loop_method ).to eq(true)
  end

  it 'return names-items' do
    stdout, stderr, status = Open3.capture3("ruby #{filename}")
    expect { puts stdout }.to output("tanaka\nnakamura\nsasaki\nsuzuki\ntanaka\nnakamura\nsasaki\nsuzuki\n").to_stdout
  end
end
