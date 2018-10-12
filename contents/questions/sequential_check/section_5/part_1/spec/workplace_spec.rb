require "open3"

is_while_method = false
last_lineno = 0
is_file_size = false
workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
filename = "#{workshop}/lib/workplace.rb"

RSpec.describe "while-check" do
  it 'check while-method, return boolean' do
    File.open(filename, "r") do |file|
      file.each_line do |line|
        is_while_method = true if line.include?('while')
        last_lineno = file.lineno
      end
    end
    puts "ErrorMessage: you don't use while-methods．" if !is_while_method
    expect( is_while_method ).to eq(true)
  end

  it 'check file_line_count, return boolean' do
    if last_lineno > 9
      is_file_size = false
      puts "ErrorMessage: you should make file of 9 lines of less."
    else
      is_file_size = true
    end
    expect( is_file_size ).to eq(true)
  end

  it 'return "1\n2\n..15\n"' do
    stdout, stderr, status = Open3.capture3("ruby #{filename}")
    expect { puts stdout }.to output("1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n").to_stdout
  end
end
