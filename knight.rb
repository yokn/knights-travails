# frozen_string_literal: true

# require_relative 'board'
require_relative 'node'
MOVESET_KNIGHT = [[2, 1], [2, -1], [1, 2], [1, -2], [-2, -1], [-2, 1], [-1, -2], [-1, 2]].freeze

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
class Knight
  def initialize
    # @board = Board.new
    @already_moved = []
    # generate_available_moves(pos)
  end

  def generate_available_moves(pos, parent, nodes = [])
    p pos

    # node = @board.find(pos[0], pos[1])

    MOVESET_KNIGHT.each do |move|
      # p move
      # p move[0]
      # p move[1]
      next unless pos[0] + move[0] <= 7 && pos[0] + move[0] >= 0 &&
                  pos[1] + move[1] <= 7 && pos[1] + move[1] >= 0 &&
                  !@already_moved.include?([pos[0] + move[0], pos[1] + move[1]])

      # p "#{pos[0] + move[0]},#{pos[1] + move[1]} is possible"
      @already_moved << [pos[0] + move[0], pos[1] + move[1]]
      nodes << Node.new([pos[0] + move[0], pos[1] + move[1]], parent)
      # return [pos[0] + move[0], pos[1] + move[1]]
      # else
      #   p "#{pos[0] + move[0]},#{pos[1] + move[1]} is unavailable"
    end
    nodes
  end

  def level_order(pointer, finish, queue = [], path = [])
    knight = Node.new(pointer)

    # p pointer
    queue << knight
    until queue.empty?
      p queue

      # p queue[0]
      # knight.parent = queue[0]
      # p "set parent to #{knight.parent}"
      # p knight
      # p knight.parent

      knight = queue.shift
      p knight.data

      # p finish
      if knight.data == finish
        p '------------------'
        p 'FOUND'
        p 'THE'
        p 'ANSWER'
        p '------------------'
        until knight.parent.nil?
          p knight
          path << knight.data
          p "added #{knight.data} to path"
          knight = knight.parent # unless knight.parent.nil?
        end
        return [pointer] + path.reverse
      end

      result = generate_available_moves(knight.data, knight)
      queue += result unless result.nil?

    end
  end
end

# MAKE EVERY AVAILABLE MOVE ITS OWN NODE
