def dist(point0, point1)
    tmp = Math.sqrt((point0[0] - point1[0])**2 + (point0[1] - point1[1])**2)
    return tmp
end

p point0 = [rand(0..10), rand(0..10)]
p point1 = [rand(0..10), rand(0..10)]

puts 'distance: '
puts dist(point0, point1)
