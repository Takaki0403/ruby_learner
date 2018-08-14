require 'workplace.rb'
require 'for-def-read'

RSpec.describe "hello" do
  it "given 'tanaka', return \"Hello, tanaka.\n\"" do
    expect(hello('tanaka')).to eq("Hello, tanaka.\n")
  end
  it "given 'yamada', return \"Hello, yamada.\n\"" do
    expect(hello('yamada')).to eq("Hello, yamada.\n")
  end
end
