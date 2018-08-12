require 'workplace'

RSpec.describe "output_string" do
  it "output 'Hello, \"Ruby.\"'" do
    expect { output_string }.to output("\"Hello,\\n\\tRuby.\"\n").to_stdout
  end
end
