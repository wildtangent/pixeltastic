require 'logger'
require 'matrix'
# Build a document
class Document
    
  attr_accessor :x, :y, :matrix

  # Initialize document matrix, and fill it with O
  def initialize(x, y)
    @x = x.to_i
    @y = y.to_i
    if @x > 50 || @y > 50
      Logger.warn("Document size is too large, setting to 50x50")
      @x = 50
      @y = 50
    end
    clear
  end
  
  # Colour a single pixel
  def colour(x, y, colour)
    return if invalid?(x, y)
    x = xform(x)
    y = xform(y)
    @matrix[y, x] = colour
  end

  # Fill a column X, Y1, Y2 with Colour
  def fill_column(x, y1, y2, colour)
    return if invalid?(x,y1) || invalid?(x,y2)
    y1.upto(y2) do |i|
      colour(x,i,colour)
    end
  end
  
  # Fill a row X1, X2, Y with Colour  
  def fill_row(x1, x2, y, colour)
    return if invalid?(x1,y) || invalid?(x2,y)
    x1.upto(x2) do |i|
      colour(i,y,colour)
    end
  end
  
  # Flood fill a region with colour
  def fill_region(x, y, colour)
    return if invalid?(x,y)
    x = xform(x)
    y = xform(y)
    target_colour = @matrix.element(y, x)
    @matrix.flood_fill(x, y, target_colour, colour)
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
    fill_region(0,0,"O")
  end

  # Translate an input value into a matrix co-ordinate
  def xform(value)
    value.to_i - 1 
  end
  
  # Determine if co-ordinates are within the document area, log a warning if not
  def invalid?(x, y, message="Specified co-ordinates are outside the document")
    if @matrix.invalid?(xform(x), xform(y))
      Logger.warn(message)
      return true
    end
    false
  end
  
end