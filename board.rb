# frozen_string_literal: true

class Board
  attr_accessor :board
  require_relative 'node'
  def initialize
    @board = []
    # @board = Array.new(8) { Array.new(8, Node.new(i)) }
    64.times do |tile_number|
      @board << Node.new(tile_number)
    end
    # p @board
  end

  def find(row, column)
    @board[row * 8 + column]
  end
end
