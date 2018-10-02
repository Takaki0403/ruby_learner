# section_3/part_2/answer.rb
# 3-2-cube.rb
array = STDIN.readlines

area = (x * y + y * z + z * x) * 2
volume = x * y * z

print '表面積=', area, "\n"
print '体積=', volume, "\n"
