# -*- coding: utf-8 -*-
require 'workplace'
require 'spec_helper'
RSpec.describe "A agreement" do
  it "given 'japan', return 'こんにちは'" do
    expect(agreement('japan')).to eq('こんにちは')
  end
  it "given 'italy', return '???'" do
    expect(agreement('italy')).to eq('???')
  end
end
