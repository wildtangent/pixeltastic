# Receive inputs from STDIN
class Input
  
  # Create a new input runner
  def initialize
    input = ""
    command = Command.new
    begin
      print "> "
      input = $stdin.gets.chomp
      command.input(input)
    end while input != "X"
  end
  
  # Run a series of commands
  def self.run(*inputs)
    command = Command.new
    inputs.each do |input|
      command.input(input)
    end
  end
end