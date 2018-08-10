require 'workplace'

RSpec.describe "output_string" do
  it "output 'Hello, Ruby.'" do
    expect(output_string).to eq('Hello, Ruby.')
  end
end

output_string
