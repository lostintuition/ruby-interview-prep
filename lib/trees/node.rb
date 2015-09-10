class Node
  attr_accessor :key, :value, :size, :left, :right, :color

  def initialize(key, value, color)
    @key = key
    @value = value
    @size = 1
    @color = color
  end
end
