# section_3/part_1/answer.rb
# 3-1-cube.rb
x = ARGV[0].to_i
y = ARGV[1].to_i
z = ARGV[2].to_i

area = (x * y + y * z + z * x) * 2
volume = x * y * z

print 'surface_area=', area, "\n"
print 'volume=', volume, "\n"
