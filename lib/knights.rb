require_relative 'board'

class Knight
  def initialize
    @grid = Board.new
    @squares = @grid.grid
  end

  def grid
    @grid.board
  end

  def possible_moves start
    start = start.is_a?(Square) ? start.coordinates : start
    moves = []
    operators = [%w[+ +], %w[+ -], %w[- +], %w[- -]]
    @squares.each do |square|
      operators.each do |opr|
        # Send + or - to each element in the array `square`, and add/subtract 1 or 2
        moves << square if start[0] == square[0].send(opr[0], 1) && # Left & right movement of 1
                           start[1] == square[1].send(opr[1], 2)    # Up & down movement of 2                                   
        moves << square if start[0] == square[0].send(opr[0], 2) && # Left & right movement of 2
                           start[1] == square[1].send(opr[1], 1)    # Up & down movement of 1
      end
    end
    moves
  end

  def find coords 
    @grid.board.each do |square|
      return square if square.coordinates == coords
    end
  end

  def add_children node
    parent = node.is_a?(Array) ? find(node) : node
    parent.children = possible_moves(node).map do |square| 
      Square.new(square[0], square[1])
    end
    parent.children.each { |child| child.parent = parent }
    parent
  end

  def knight_moves start, finish
    return "Please select a legal move" if bad_move?(start + finish)
    start = add_children(start)
    queue = [start]
    until queue.empty?
      current = queue.shift
      add_children(current) if current.children.empty?
      current.children.each do |child|
        if child.coordinates == finish
          path = get_path_from(child, start)
          display_path([start.coordinates] + path.reverse)
          return
        end
        queue << add_children(child)
      end
    end
  end
  
  def bad_move? moves
    moves.each do |num|
      return true if num > 8 || num < 1
    end 
    false
  end

  def display_path path_array
    puts "It took #{path_array.size - 1} moves. The shortest path is:"
    path_array.each { |square| print "#{square} "}
  end

  def get_path_from start, destination
    coord_path = []
    current = start
    until current.coordinates == destination.coordinates
      coord_path << current.coordinates
      current = current.parent
    end
    coord_path
  end
end