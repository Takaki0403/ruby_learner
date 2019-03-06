require_relative './traveling_salesman.rb'
require 'colorize'

class TraveringSalesmanExp < TravelingSalesman
  def execution
    puts "Please input temperature"
    temp = STDIN.gets.chomp.to_f
    puts "Please input loop_count"
    loop_count = STDIN.gets.chomp.to_i
    first_temp = temp
    std_energy = save_energy
    puts "first std_energy: #{std_energy}"
    change_count = 0
    cool = 0.9
    loop_count.times do
      i = rand(1...@route.size-1)
      j = 0
      loop do
        j = rand(1...@route.size-1)
        break if i != j
      end
      i,j=j,i if i>j
      # exchange1: revese per randam area
      rev = @route[i..j].reverse
      @route[i..j] = rev
      # exchange2: revese 2points
      # @routes.swap!(i, j)
      compared_energy = energy(@route)
      dE = compared_energy - std_energy
      if dE <= 0
        next if dE == 0
        std_energy = save_energy
        change_count+=1
      else
        exp1 = Math.exp(dE * -1 / temp)
        ra = rand()
        if exp1 > ra
          puts "not minimum".red
          std_energy = save_energy
          change_count+=1
        else
          @route[i..j] = rev.reverse
        end
      end
      # temp *= cool
    end
    gnuplot
  end

  def save_energy
    add_routes(@route.clone)
    std_energy = energy(@route)
  end
  
  def choose(exp)
    puts exp
    flag = rand() < exp
    flag
  end
end
