##
# This ConsoleIO class defines the details of how input is obtained and how text is output to the console

class ConsoleIO
  def output(text)
    puts text
  end

  def read_input
    gets.chomp.strip
  end
end
