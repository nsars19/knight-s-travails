require_relative 'square'

class Board
  attr_reader :board, :grid

  def initialize
    @board = populate_board
    @grid = get_coordinates
  end

  def populate_board
    squares = []
    (1..8).each do |x_coord|
      (1..8).each do |y_coord|
        squares << Square.new(x_coord, y_coord)
      end
    end
    squares
  end

  def get_coordinates
    coordinates = []
    @board.each do |square|
      coordinates << square.coordinates
    end
    coordinates
  end
end