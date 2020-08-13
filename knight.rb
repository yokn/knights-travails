# frozen_string_literal: true

require_relative 'board'
LEGAL_MOVES = [[2, 1], [2, -1], [1, 2], [1, -2], [-2, -1], [-2, 1], [-1, -2], [-1, 2]].freeze

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
class Knight
  def initialize
    @board = Board.new
    @already_moved = []
    # generate_available_moves(pos)
  end

  def generate_available_moves(start)
    p start

    node = @board.find(start[0], start[1])

    LEGAL_MOVES.each do |move|
      # p move
      # p move[0]
      # p move[1]
      if start[0] + move[0] <= 7 && start[0] + move[0] >= 0 &&
         start[1] + move[1] <= 7 && start[1] + move[1] >= 0 &&
         !@already_moved.include?([start[0] + move[0], start[1] + move[1]])
        p "#{start[0] + move[0]},#{start[1] + move[1]} is possible"
        @already_moved << [start[0] + move[0], start[1] + move[1]]
        node.add_available_moves(start[0] + move[0], start[1] + move[1])
        # return [start[0] + move[0], start[1] + move[1]]
      else
        p "#{start[0] + move[0]},#{start[1] + move[1]} is unavailable"
      end
    end
    node.available_moves
  end

  def level_order(pointer, finish, queue = [], path = [])
    # return if pointer.nil?
    # finish = finish[0] * 8 + finish[1]
    # pointer = @board.find(pointer[0], pointer[1])

    # p pointer
    queue << pointer
    until queue.empty?
      p queue
      # queue.flatten!(1)
      current = queue.shift
      p current
      # binding.pry
      return path if current == finish

      # division = current.data / 8
      # remainder = current.data % 8
      result = generate_available_moves(current)
      queue += result unless result.nil?
      path += result unless result.nil?
      # queue.shift
    end
  end
end
