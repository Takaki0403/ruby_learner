file = ARGV[0]
sum_item1 = 0
count_item = 0
result_lines = []
File.open(file, "r+") do |file|
  file.each_line.with_index do |line, index|
    if index  >= 8
      items = line.split
      sum_item1 += items[1].to_f
      if items[0].to_f < 0.5
        items[0] = items[0].to_f * 2
        result_lines.push(items.join("    "))
      end
      count_item = index - 7
    else
      result_lines.push(line)
    end
  end
end

File.open("new_#{file}", "w+") do |file|
  result_lines.each do |line|
    file.puts(line)
  end
end

p count_item
p sum_item1 / count_item
