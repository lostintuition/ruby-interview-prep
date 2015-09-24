class AvlTree
  module Balance
    LEFT_RIGHT = :left_right
    LEFT_LEFT = :left_left
    RIGHT_LEFT = :right_left
    RIGHT_RIGHT = :right_right
    BALANCED = :balanced
  end

  def insert(key, value)
    insert_node(@root, key, value)
  end

  def insert_node(node, key, value)
    return Node.new(key, value) if node.nil?

    if key < node.key
      insert_node(node.left, key, value)
    elsif key > node.key
      insert_node(node.right, key, value)
    end

    balance = get_balance(node, key)
    if balance == Balance::LEFT_RIGHT
    elsif balance == Balance::LEFT_LEFT
      return right_rotate(node)
    elsif balance == Balance::RIGHT_LEFT
    elsif balance == Balance::RIGHT_RIGHT
      return left_rotate(node)
    end

    return node
  end

  def get_balance(node, key)
    height_difference = get_height(node.left) - get_height(node.right)
    if height_difference > 0 && key < node.left.key
      return Balance::LEFT_LEFT
    elsif height_difference > 0 && key > node.left.key
      return Balance::LEFT_RIGHT
    elsif height_difference < 0 && key < node.right.key
      return Balance::RIGHT_LEFT
    elsif height_difference < 0 && key > node.right.key
      return Balance::RIGHT_RIGHT
    else
      return Balance::BALANCED
    end
  end

  def get_height(node)
    return node.nil? ? -1 : node.height
  end

  class Node
    attr_accessor :key, :value, :size, :left, :right, :height

    def initialize(key, value)
      @key = key
      @value = value
      @size = 1
      @height = 0
    end
  end
end
