# -*- coding: utf-8 -*-
require '1.rb'
RSpec.describe "If test" do
  it "given 'japan', return 'こんにちは'" do
    expect(if_test('japan')).to eq('こんにちは')
  end
end
