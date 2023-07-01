# frozen_string_literal: true

class Node
  attr_accessor :next, :data

  def initialize(data = nil)
    @data = data
    @next = nil
  end
end
