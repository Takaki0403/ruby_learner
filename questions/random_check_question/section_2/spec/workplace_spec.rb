# -*- coding: undecided -*-
require 'workplace.rb'

RSpec.describe "A agreement" do
  it "given 'japan', return 'こんにちは'" do
    expect(agreement('japan')).to eq('こんにちは')
  end
  it "given 'italy', return '???'" do
    expect(agreement('italy')).to eq('???')
  end
end
