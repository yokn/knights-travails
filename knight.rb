# frozen_string_literal: true

require_relative 'node'
MOVESET_KNIGHT = [[2, 1], [2, -1], [1, 2], [1, -2], [-2, -1], [-2, 1], [-1, -2], [-1, 2]].freeze

# rubocop:disable Metrics/AbcSize
class Knight
  def initialize
    @already_moved = []
  end

  def generate_available_moves(pos, parent, nodes = [])
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
      # else
      #   p "#{pos[0] + move[0]},#{pos[1] + move[1]} is unavailable"
    end
    nodes
  end

  def level_order(pointer, finish, queue = [])
    knight = Node.new(pointer)
    queue << knight
    until queue.empty?
      # p queue
      knight = queue.shift
      p knight.data

      return print_result(knight, pointer) if knight.data == finish

      result = generate_available_moves(knight.data, knight)
      queue += result unless result.nil?
    end
  end

  def print_result(knight, pointer, path = [])
    until knight.parent.nil?
      # p knight
      path << knight.data
      p "added #{knight.data} to path"
      knight = knight.parent
    end
    puts "You made it in #{path.length} moves! Here's your path:"
    [pointer] + path.reverse
  end
end
