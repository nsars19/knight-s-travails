class Square #or Vertex
  attr_reader :x_coord, :y_coord
  
  def initialize x_coordinate, y_coordinate
    @x_coord = x_coordinate
    @y_coord = y_coordinate
  end

  def coordinates
    [@x_coord, @y_coord]
  end
end