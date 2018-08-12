# -*- coding: utf-8 -*-
require 'workplace'

RSpec.describe "output_string" do
  it "output 'Hello, \"Ruby.\"'" do
    expect { output_string }.to output("Hello, Ruby.\n").to_stdout
  end
end

