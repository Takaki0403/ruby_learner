module CopSpec

  def copspec(file_path)
    @file = file_path
    flag_rspec = rspec_check
    return if !flag_rspec
    flag_rubocop = rubocop_check
    return if !flag_rubocop
    puts "**********************************"
    puts "Final Error Check"
    puts "**********************************"
    flag_final = check("rspec")
    if flag_final
      puts "your code is perfect."
    else
      puts "not perfect, please fix your code."
    end
  end
  module_function :copspec

  def self.rspec_check
    puts "**********************************"
    puts "RSpec Error Check"
    puts "**********************************"
    file = @file.match(/.*\/lib/)[0]
    file = "#{file[0..file.size-5]}/spec"
    return check("rspec", file)
  end
  private_class_method :rspec_check

  def self.rubocop_check
    puts "**********************************"
    puts "Rubocop Error Check"
    puts "**********************************"
    return check("rubocop", @file)
  end
  private_class_method :rubocop_check

  def self.check(check_mode, file)
    flag_check = false
    flag_check = system "#{check_mode} #{file}"
    if  flag_check
      puts "#{check_mode} check is clear!"
    end
    return flag_check
  end
  private_class_method :check

end
