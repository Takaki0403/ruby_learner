require "fileutils"
class PhysicsSort
  def initialize(file)
    @origin = "#{ENV['HOME']}/PhysicsSort/physics.txt"
    FileUtils.mkdir_p("#{ENV['HOME']}/PhysicsSort") unless FileTest.exist?("#{ENV['HOME']}/PhysicsSort")
    FileUtils.cp(file, @origin)
    @new = "#{ENV['HOME']}/PhysicsSort/physics_sorted.txt"
    FileUtils.touch(@new)
  end

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

  def all_to_f(objs)
    objs.each_with_index do |obj, index|
          objs[index] = obj.to_f
    end
    objs
  end
  
  def sort_lines(need_lines)
    lines = need_lines(@origin, need_lines)
    lines_index = []
    first = -10**7
    results = []
    lines.clone.each_with_index do |line, index|
      lines[index] = line.split
    end
    
    File.open(@new, "r+") do |file|
      # all_to_f
      lines.each_with_index do |line, index|
        lines_index << [all_to_f(line), index]
      end
      # sort
      lines_index.sort_by! do |x|
        [x[0][0], x[0][1]]
      end
      # format_arrangement
      lines_index.each do |item|
        if first < item[0][0]
          first = item[0][0]
          results << "\n"
        end

        item[0].each_with_index do |i, indx|
          item[0][indx] = i.to_s
          item[0][indx].insert(0, '+') if item[0][indx][0] != '-'
        end
        results << item[0].join(" ")
      end
      results.shift if results[0] == "\n"
      # file_write
      results.each do |item|
        file.puts(item)
      end
    end
  end
end

# puts 'Please input original_file_path'
# file_path = STDIN.gets.chom
file_path = ARGV[0]
physics_sort = PhysicsSort.new(file_path)
physics_sort.sort_lines([0, 1, 5])
#physics_sort.cut_lines([0, 1, 5])
