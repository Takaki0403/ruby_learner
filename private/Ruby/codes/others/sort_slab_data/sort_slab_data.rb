require "fileutils"
class SortSlabData

  def initialize
  end

  # get necessary lines from the file
  def need_lines(file, need_lines)
    new_lines = []
    File.open(file, "r+") do |file|
      file.each_line do |f|
        items = f.split
        items.clone.each_with_index.reverse_each do |line, index|
            items.delete_at(index) unless need_lines.include?(index)
        end
        new_lines << items.join(" ")
      end
    end
    new_lines
  end

  def sort_lines(lines, sort_lines)
    lines = lines.clone
    lines.clone.each_with_index do |line, index|
      lines[index] = all_to_f(line.split)
    end
    # sort
    lines.sort_by! do |x|
      sort_items = []
      sort_lines.each do |line|
        sort_items << x[line]
      end
      sort_items
    end
    lines
  end

  
  def write_lines(file, lines)
    contents = []
    File.open(file, "w+") do |file|
      min = -(10**7)
      # format_arrangement
      lines.each do |line|
        if min < line[0]
          min = line[0]
          contents << "\n"
        end

        line.each_with_index do |item, index|
          line[index] = item.to_s
          line[index].insert(0, '+') if line[index][0] != '-'
        end
        contents << line.join(" ")
      end
      contents.shift if contents[0] == "\n"
      # file_write
      contents.each do |content|
        file.puts(content)
      end
    end
  end

  private

  def all_to_f(objs)
    objs.each_with_index do |obj, index|
      objs[index] = obj.to_f
    end
    objs
  end
end

# make x, y, energy file
file_path = ARGV[0]
physics_sort = SortSlabData.new
lines = physics_sort.need_lines(file_path, [0, 1, 5])
sorted_lines = physics_sort.sort_lines(lines, [0, 1])
physics_sort.write_lines("xy_E_#{file_path}", sorted_lines)

# make only energy file
File.open("E_#{file_path}", "w+") do |file|
  sorted_lines.each do |line|
    file.puts(line[2])
  end
end

# make tomoko_y original file
File.open("fitting_data_#{file_path}", "w+") do |file|
  file.puts("x = [")
  sorted_lines.each_with_index do |line, index|
    if index == sorted_lines.size-1
      file.puts("#{line[0]}]")
    else
      file.puts("#{line[0]},")
    end
  end
  file.puts("y = [")
  sorted_lines.each_with_index do |line, index|
    if index == sorted_lines.size-1
      file.puts("#{line[1]}]")
    else
      file.puts("#{line[1]},")
    end
  end
  file.puts("E = [")
  sorted_lines.each_with_index do |line, index|
    if index == sorted_lines.size-1
      file.puts("#{line[2]}]")
    else
      file.puts("#{line[2]},")
    end
  end

end
