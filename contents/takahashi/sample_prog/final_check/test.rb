# -*- coding: utf-8 -*-
# 受け取った引数に応じたファイルを読み込んで出力

def method2(result)
  filename = "#{result}.rb"
  print File.read(filename)
end

# 受け取った引数を計算するメソッド

def method1(num0, num1)
  num0 * num1 % 6
end

num0 = ARGV[0].to_i
num1 = ARGV[1].to_i

result = method1(num0, num1)

method2(result)
