# frozen_string_literal: true

require_relative 'knight'
require 'pry'
# generate the board with nodes
# fill the nodes with possible edges

def knight_moves(start, finish)
  @knight = Knight.new
  p @knight.level_order(start, finish)
end
knight_moves([2, 1], [1, 2])
# knight_moves([0, 0], [1, 2])
# knight_moves([0, 0], [3, 3])
# knight_moves([3, 3], [0, 0])
