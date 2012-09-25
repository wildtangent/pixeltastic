class Command
  
  attr_accessor :command, :document
  
  # Take the input that was entered, split it and send to be processed
  def input(command)
    command = command.split(" ")
    process(command)
  end
  
  # Process the command that was entered
  def process(command)
    case command.first
    when "I"
      # Initialize the document M,N with white pixels
      @document = Document.new(command[1], command[2])

    when "C"
      # Clear the table
      @document.clear
      
    when "L"
      # Colour pixel X,Y with colour C
      @document.colour(command[1], command[2], command[3])
    
    when "V"
      # Draw vertical segment X, Y1,Y2, C
      @document.fill_column(command[1], command[2], command[3], command[4])
      
    when "H"
      # Draw horizontal segment X1,X2,Y,C
      @document.fill_row(command[1], command[2], command[3], command[4])
      
    when "F"
      # Fill region X,Y (R) with colour C
      document.fill_region(command[1], command[2],command[3])
      
    when "S"
      # Show contents
      @document.print
      
    when "X"
      # Terminate session
      Logger.info "Terminating session"
      exit 0
      
    end
  end
end

# Build a document
class Document
  
  require 'matrix'
  
  attr_accessor :x, :y, :matrix

  # Initialize document matrix
  def initialize(x, y)
    @x = x.to_i
    @y = y.to_i
    clear
  end
  
  # Colour a single pixel
  def colour(x, y, colour)
    x = xform(x)
    y = xform(y)
    @matrix[y, x] = colour
  end

  # Fill a column X, Y1, Y2 with Colour
  def fill_column(x, y1, y2, colour)
    y1.upto(y2) do |i|
      colour(x,i,colour)
    end
  end
  
  # Fill a row X1, X2, Y with Colour  
  def fill_row(x1, x2, y, colour)
    x1.upto(x2) do |i|
      colour(i,y,colour)
    end
  end 

  # Fill a region X, Y (where X,Y is the centre pixel, blah blah fill the with Colour  
  def fill_region(x, y, colour)
    #meh
    colour(x,y,colour)
    x = xform(x)
    y = xform(y)
    centre = @matrix.element(y, x)

    # Find max size of the matrix
    row_size = @matrix.row_size
    column_size = @matrix.column_size

    puts row_size
    puts column_size
    
    # north: (y, x-1)
    # south: (y, x+1)
    # east:  (y+1, x)
    # west:  (y-1, x)
    
    
    
    
    
  end
  
  # Print the document
  def print
    @matrix.to_a.each do |y|
      Logger.log(y.join("") << "\n")
    end
  end
  
  # Zero the matrix 
  def clear
    @matrix = Matrix.zero(@y,@x)
  end

  # Translate an input value into a matrix co-ordinate
  def xform(value)
    value.to_i - 1 
  end
  
end

# Log something
class Logger
  
  @@log_level = 2
  
  def self.info(message)
    log(message) if @@log_level > 0
  end
  
  def self.debug(message)
    log(message) if @@log_level > 1
  end
  
  def self.log(message)
    puts message
  end
  
end

# Receive inputs from STDIN
class Input
  def initialize
    input = ""
    command = Command.new
    begin
      print "> "
      input = $stdin.gets.chomp
      command.input(input)
    end while input != "X"
  end
end

class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end



Input.new