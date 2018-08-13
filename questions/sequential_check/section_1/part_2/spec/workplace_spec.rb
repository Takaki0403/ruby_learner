# -*- coding: utf-8 -*-
require 'workplace'

RSpec.describe "output_string" do
  let(:out) { "Hello, Ruby.\n" }
  it "output 'Hello, Ruby.\n'" do
    expect { output_string }.to output(out).to_stdout
  end
end

