# frozen_string_literal: true

class Knight
  attr_accessor :available_moves
  # def initialize(pos)
  #   generate_available_moves(pos)
  # end

  def generate_available_moves(pos)
    p "pos is: #{pos}"
    available_moves = []
    available_moves << pos
    p "available_moves is: #{available_moves}"
    available_moves
  end
end
