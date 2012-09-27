class Matrix
  
  # Allow setting of values at given matrix co-ordinate
  def []=(i, j, x)
    @rows[i][j] = x
  end
  
  # Flood fill the matrix with adjacent colours
  # Similar to paint or minesweeper logic!
  def flood_fill(x, y, target, replacement)
    return if invalid?(x,y)    
    return if self.element(y, x) != target
    return if self.element(y, x) == replacement

    self[y, x] = replacement
    flood_fill(x+1, y, target, replacement)
    flood_fill(x-1, y, target, replacement)
    flood_fill(x, y+1, target, replacement)
    flood_fill(x, y-1, target, replacement)
  end
  
  # Check if a matrix point actually exists (e.g. not outside the grid)
  def valid?(x, y)
    !self.element(y, x).nil?
  end
  
  # Syntatic sugar for valid/invalid
  def invalid?(x, y)
    !valid?(x, y)
  end
  
end