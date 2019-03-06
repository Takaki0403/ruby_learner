require "fileutils"
class PhysicsSort
  def initialize(file)
    @origin = "#{ENV['HOME']}/PhysicsSort/physics.txt"
    FileUtils.mkdir_p("#{ENV['HOME']}/PhysicsSort") unless FileTest.exist?("#{ENV['HOME']}/PhysicsSort")
    FileUtils.cp(file, @origin)
    @new = "#{ENV['HOME']}/PhysicsSort/physics_sorted.txt"
    FileUtils.touch(@new)
  end

  def cut_lines(need_lines)
    File.open(@new,'w'){|file| file = nil}
    new_lines = []
    File.open(@origin, "r+") do |file|
      file.each_line do |f|
        items = f.split
        items_clone = items.clone
        items_clone.each_with_index.reverse_each do |line, index|
          unless need_lines.include?(index)
            items.delete_at(index)
          end
        end
        new_lines << items.join(" ")
      end
    end
    File.open(@new, "r+") do |file|
      new_lines.each do |line|
        file.puts(line)
      end
    end
  end

  def sort_lines(need_lines)
    cut_lines(need_lines)
    lines = []
    lines_index = []
    File.open(@new, "r+") do |file|
      file.each_line do |f|
        tmp = f.split
        lines << tmp
        # [ [], [], []]
      end
      lines.each_with_index do |item, index|
        item.each_with_index do |i, indx|
          item[indx] = i.to_f
        end
        lines_index << [item, index]
      end
      lines_index.sort_by! do |x|
        [x[0][0], x[0][1]]
      end
    end
    results = []
    first = -10**7
    File.open(@new,'w'){|file| file = nil}
    File.open(@new, "r+") do |file|
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
