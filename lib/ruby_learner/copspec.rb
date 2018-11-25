module CopSpec

  def copspec(file_path, opt)
    @file = file_path
    flag_rspec = rspec_check
    break if !flag_rspec
    flag_rubocop = rubocop_check
    break if !flag_rubocop
    puts "**********************************"
    puts "Final Error Check"
    puts "**********************************"
    flag_final = check("rspec", @file)
    if flag_final
      puts "your code is perfect."
    else
      puts "not perfect, please fix your code."
    end
  end
  module_function :copspec

  def rspec_check
    puts "**********************************"
    puts "RSpec Error Check"
    puts "**********************************"
    return check("rspec")
  end
  private_class_method :rspec_check

  def rubocop_check
    puts "**********************************"
    puts "Rubocop Error Check"
    puts "**********************************"
    return check("rubocop")
  end
  private_class_method :rubocop_check

  def check(check_mode)
    flag_check = false
    puts "---------------------------"
    puts "#{check_mode}"
    puts "---------------------------"
    flag_check = system "#{check_mode} #{@file}"
    if  flag_check
      puts "#{check_mode} check is clear!"
      break
    end
    return flag_check
  end
  private_class_method :check

end
