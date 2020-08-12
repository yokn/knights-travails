# frozen_string_literal: true

require_relative 'knight'

# generate the board with nodes
# fill the nodes with possible edges

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
def knight_moves(start, _finish)
  @knight = Knight.new
  arr = Array.new(8) { Array.new(8, 0) }

  # p arr
  # p @knight
  legal_moves = [[2, 1], [2, -1], [1, 2], [1, -2], [-2, -1], [-2, 1], [-1, -2], [-1, 2]]

  legal_moves.each do |move|
    # p move
    # p move[0]
    # p move[1]
    if start[0] + move[0] < 7 && start[0] + move[0] >= 0 &&
       start[1] + move[1] < 7 && start[1] + move[1] >= 0
      p "#{move[0]},#{move[1]} is possible"
      puts ''
    else
      p "#{move[0]},#{move[1]} is out of bounds"
      puts ''
    end
    # p move
    # row = move[0]
    # column = move[1]
    # p row
    # p column

    # if @knight.generate_available_moves(start).include?([move[0]] && arr[move[1]])
    #   p "#{move[0]},#{move[1]} is possible"
    #   puts ''
    # end
  end
end
knight_moves([2, 1], [1, 2])
# knight_moves([0, 0], [1, 2])
# knight_moves([0, 0], [3, 3])
# knight_moves([3, 3], [0, 0])
