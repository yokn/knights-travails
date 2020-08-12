# frozen_string_literal: true

class Board
  attr_accessor :board
  require_relative 'node'
  def initialize
    @board = Array.new(8) { Array.new(8, Node.new) }
  end

  def next
    @board[0][0]
  end
end
