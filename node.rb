# frozen_string_literal: true

require_relative 'knight'

class Node
  attr_accessor :available_moves, :data
  def initialize(tile_number)
    @data = tile_number
    @available_moves = []
  end

  def add_available_moves(column, row)
    @available_moves << [column, row]
    p "added #{[column, row]} as a possible move for tile ##{@data}"
  end
end
