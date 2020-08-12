# frozen_string_literal: true

require_relative 'board'
LEGAL_MOVES = [[2, 1], [2, -1], [1, 2], [1, -2], [-2, -1], [-2, 1], [-1, -2], [-1, 2]].freeze

# rubocop:disable Metrics/AbcSize
class Knight
  def initialize(pos)
    @board = Board.new
    generate_available_moves(pos, @board.next)
  end

  def generate_available_moves(start, node)
    LEGAL_MOVES.each do |move|
      # p move
      # p move[0]
      # p move[1]
      if start[0] + move[0] < 7 && start[0] + move[0] >= 0 &&
         start[1] + move[1] < 7 && start[1] + move[1] >= 0
        p "#{start[0] + move[0]},#{start[1] + move[1]} is possible"
        node.add_available_moves(start[0] + move[0], start[1] + move[1])
      else
        p "#{start[0] + move[0]},#{start[1] + move[1]} is out of bounds"

      end
    end
  end
end
