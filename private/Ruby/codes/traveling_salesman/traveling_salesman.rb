require 'numo/gnuplot'
class Array
  def swap(idx1,idx2)
    temp = self.dup
    temp[idx1],temp[idx2] = temp[idx2],temp[idx1]
    temp
  end

  def swap!(idx1,idx2)
    self[idx1],self[idx2] = self[idx2],self[idx1]
    self
  end
end

class TravelingSalesman
  def initialize(points_count)
    # the component is {id: Int, x_point: Float, y_point: Float}
    @route = init_route(points_count)
    @routes = [] # for plot
  end

  def execution
    add_routes(@route.clone)
    std_energy = energy(@route)
    puts "first std_energy: #{std_energy}"
    exchanges = mk_full_orders(@route, 1, @route.size-2)
    exchanges.each do |order_item|
      @route[1..@route.size-2] = order_item
      compared_energy = energy(@route)
      if std_energy > compared_energy
        add_routes(@route.clone)
        std_energy = compared_energy
      end
    end
    @route.each do |item|
      puts "min_distance_order_sales_points: #{item[:id]}"
    end
    puts "std_energy: #{std_energy}"
    gnuplot
  end

  def add_routes(hashes)
    @routes << [[], []]
    hashes.each do |hash|
      @routes.last[0] << hash[:x_point]
      @routes.last[1] << hash[:y_point]
    end
  end
  
  def gnuplot
    points = @routes
    Numo.gnuplot do
      set output: 'traveling_salesman_gnuplot.gif'
      set term: 'gif', animate:true, delay:12, size:[500,500]
      set :nokey
      set size: {ratio: 1.0}
      set xrange: -0.1..1.1
      set yrange: -0.1..1.1
      unset :colorbox
      set palette_defined:'(0 "white", 1 "green")'
      points.each do |item|
        plot item[0], item[1], w: :lp, pt: 6
      end
    end
  end
  
  def mk_full_orders(hashes, from_index, to_index)
    exchanges = []
    count = 0
    first_nums = []
    first_num = 1
    for i in 0...(to_index - from_index)
      first_num *= (to_index - 1 - from_index - i + 1)
    end
    hashes[from_index..to_index].permutation(to_index - from_index + 1) do |item|
      first_nums << item[0][:id] if count % first_num == 0
      exchanges << item if !first_nums.include?(item.last[:id])
      count += 1
    end
    exchanges
  end
  
  def dist(point0, point1)
    tmp = Math.sqrt((point0[0] - point1[0])**2 + (point0[1] - point1[1])**2)
    return tmp
  end
  
  def energy(order_points)
    tmp = 0.0
    for i in 0..order_points.size-2 do
      tmp+=dist([order_points[i][:x_point], order_points[i][:y_point]],
                    [order_points[i+1][:x_point], order_points[i+1][:y_point]])
    end
    return tmp
  end
  
  def init_route(size)
    order_points = []
    for item in 0...size
      order_points << {id: item, x_point: rand(0...100).to_f/100, y_point: rand(0..100).to_f/100}
    end
    order_points << order_points[0]
    order_points
  end
end
