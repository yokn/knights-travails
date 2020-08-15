# frozen_string_literal: true

require_relative 'knight'

# INITIAL PLAN:
# generate the board with nodes
# fill the nodes with possible edges

# ACTUAL:
# every node is a possible move
# create new nodes only when needed
# keep track of tiles already moved to avoid an infinite loop

def knight_moves(start, finish)
  p Knight.new.level_order(start, finish)
end

knight_moves([2, 1], [1, 2])
knight_moves([0, 0], [1, 2])
knight_moves([0, 0], [3, 3])
knight_moves([3, 3], [0, 0])

# knight_moves([0, 0], [7, 7])
# knight_moves([3, 3], [7, 7])
