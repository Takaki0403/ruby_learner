require "open3"

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
    stdout, stderr, status = Open3.capture3("ruby #{filename}", :stdin_data=>"Japan\n")
    expect { puts stdout }.to output("こんにちは\n").to_stdout
  end
  it 'given USA, return "Hello\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{filename}", :stdin_data=>"USA\n")
    expect { puts stdout }.to output("Hello\n").to_stdout
  end
  it 'given Italy, return "else\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{filename}", :stdin_data=>"Italy\n")
    expect { puts stdout }.to output("else\n").to_stdout
  end
end
