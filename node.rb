# frozen_string_literal: true

class Node
  attr_accessor :data, :parent
  def initialize(tile_number, parent = nil)
    @data = tile_number
    @parent = parent
  end
end
