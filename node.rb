# frozen_string_literal: true

class Node
  def initialize
    @available_moves = []
  end

  def add_available_moves(column, row)
    @available_moves << [column, row]
    p "added #{[column, row]} as a possible move for #{self}"
  end
end
