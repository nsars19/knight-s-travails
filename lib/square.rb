class Square #or Vertex/Node
  attr_accessor :children, :parent
  attr_reader :coordinates
  
  def initialize x_coordinate, y_coordinate
    @coordinates = [x_coordinate, y_coordinate]
    @children = []
    @parent = nil
  end
end