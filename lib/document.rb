require 'logger'
require 'matrix'
# Build a document
class Document
    
  attr_accessor :x, :y, :matrix

  # Initialize document matrix, and fill it with O
  def initialize(x, y)
    @x = x.to_i
    @y = y.to_i
    clear
    fill_region(0,0,"O")
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
  
  # Flood fill a region with colour
  def fill_region(x, y, colour)
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
  end

  # Translate an input value into a matrix co-ordinate
  def xform(value)
    value.to_i - 1 
  end
  
end