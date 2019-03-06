require_relative './traveling_salesman.rb'
require_relative './traveling_salesman_exp.rb'

srand(0)
puts 'Please input city count'
get_count = STDIN.gets.chomp.to_i

#traveling_salesman = TravelingSalesman.new(get_count)
#traveling_salesman.execution

traveling_salesman_exp = TraveringSalesmanExp.new(get_count)
traveling_salesman_exp.execution
