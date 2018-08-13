# -*- coding: utf-8 -*-
require "open3"

RSpec.describe "symbol-check" do
  it 'put some datas' do
    workshop = "#{ENV['HOME']}/ruby_learner/workshop"
    stdout, stderr, status = Open3.capture3("ruby #{workshop}/lib/workplace.rb")
    expect { puts stdout }.to output("{:name=>\"高橋\", :furigana=>\"タカハシ\"}\n{:name=>\"高橋\", :furigana=>\"タカハシ\", :tel=>\"000-1234-5678\"}\n").to_stdout
  end
end
