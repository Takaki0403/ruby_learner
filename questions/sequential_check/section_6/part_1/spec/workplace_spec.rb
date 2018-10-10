require "open3"

is_array1_method = false
is_array3_method = false
workshop = "#{ENV['HOME']}/.ruby_learner/workshop"
filename = "#{workshop}/lib/workplace.rb"
RSpec.describe "Array-check" do
  it 'check loop-method, return boolean' do
    File.open(filename, "r") do |file|
      file.each_line do |line|
        is_array1_method = true if line.include?('nums[1]')
        is_array3_method = true if line.include?('nums[3]')
      end
    end
    puts "ErrorMessage: you don't use nums[1]-method．" if !is_array1_method
    puts "ErrorMessage: you don't use nums[3]-method．" if !is_array3_method
    expect( is_array1_method ).to eq(true)
    expect( is_array3_method ).to eq(true)
  end
  
  it 'return [1, 5, 3, 7, 5]\n[1, 2, 3, 4, 5]\n' do

    stdout, stderr, status = Open3.capture3("ruby #{filename}")
    expect { puts stdout }.to output("[1, 5, 3, 7, 5]\n[1, 2, 3, 4, 5]\n").to_stdout
  end
end
