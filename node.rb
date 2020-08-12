# frozen_string_literal: true

class Node
  def initialize(tile_number)
    @data = tile_number
    @available_moves = []
  end

  def add_available_moves(column, row)
    @available_moves << [column, row]
    p "added #{[column, row]} as a possible move for tile ##{@data}"
  end
end
