class AvlTree
  module Balance
    LEFT_RIGHT = :left_right
    LEFT_LEFT = :left_left
    RIGHT_LEFT = :right_left
    RIGHT_RIGHT = :right_right
    BALANCED = :balanced
  end

  def insert(key, value)
    @root = insert_node(@root, key, value)
  end

  def insert_node(node, key, value)
    return Node.new(key, value) if node.nil?

    if key < node.key
      node.left = insert_node(node.left, key, value)
    elsif key > node.key
      node.right = insert_node(node.right, key, value)
    end

    update_height(node)

    balance = get_balance(node, key)
    if balance == Balance::LEFT_RIGHT
      node.left = left_rotate(node.left)
      return right_rotate(node)
    elsif balance == Balance::LEFT_LEFT
      return right_rotate(node)
    elsif balance == Balance::RIGHT_LEFT
      node.right = right_rotate(node.right)
      return left_rotate(node)
    elsif balance == Balance::RIGHT_RIGHT
      return left_rotate(node)
    end

    return node
  end

  def getMinNode(node)
    current = node
    while (!current.left.nil?)
      current = current.left
    end

    return current
  end

  def delete(key)
    @root = delete_node(@root, key)
  end

  def delete_node(node, key)
    return nil if node.nil?

    if key < node.key
      node.left = delete_node(node.left, key)
    elsif key > node.key
      node.right = delete_node(node.right, key)
    else
      if node.left.nil? || node.right.nil?
        node = node.left.nil? ? node.right : node.left
      else
        min_node = getMinNode(node.right)
        node.key = min_node.key
        node.value = min_node.value
        node.right = delete_node(node.right, min_node.key)
      end
    end

    return nil if node.nil?

    update_height(node)
    balance = get_delete_balance(node, key)

    if balance == Balance::LEFT_LEFT
      return right_rotate(node)
    elsif balance == Balance::LEFT_RIGHT
      node.left = left_rotate(node.left)
      return right_rotate(node)
    elsif balance == Balance::RIGHT_RIGHT
      return left_rotate(node)
    elsif balance == Balance::RIGHT_LEFT
      node.right = right_rotate(node.right)
      return left_rotate(node)
    end

    return node
  end

  def right_rotate(node)
    new_right_child = node
    new_root = node.left

    new_right_child.left = new_root.right
    new_root.right = new_right_child

    update_height(new_right_child)
    update_height(new_root)
    return new_root
  end

  def left_rotate(node)
    new_root = node.right
    new_left_child = node

    new_left_child.right = new_root.left
    new_root.left = new_left_child

    update_height(new_left_child)
    update_height(new_root)
    return new_root
  end

  def update_height(node)
    node.height = [get_height(node.left), get_height(node.right)].max + 1
  end

  # compares key to the left and right keys because that determines the path from the newly inserted leaf
  def get_balance(node, key)
    height_difference = get_height(node.left) - get_height(node.right)
    if height_difference > 1 && key < node.left.key
      return Balance::LEFT_LEFT
    elsif height_difference > 1 && key > node.left.key
      return Balance::LEFT_RIGHT
    elsif height_difference < -1 && key < node.right.key
      return Balance::RIGHT_LEFT
    elsif height_difference < -1 && key > node.right.key
      return Balance::RIGHT_RIGHT
    else
      return Balance::BALANCED
    end
  end

  def get_delete_balance(node, key)
    height_difference = get_height_difference(node)
    if height_difference > 1 && get_height_difference(node.left) > 1
      return Balance::LEFT_LEFT
    elsif height_difference > 1 && get_height_difference(node.left) < -1
      return Balance::LEFT_RIGHT
    elsif height_difference < -1 && get_height_difference(node.right) > 1
      return Balance::RIGHT_LEFT
    elsif height_difference < -1 && get_height_difference(node.right) < -1
      return Balance::RIGHT_RIGHT
    else
      return Balance::BALANCED
    end
  end

  def get_height_difference(node)
    return 0 if node.nil?
    return get_height(node.left) - get_height(node.right)
  end

  def get_height(node)
    return node.nil? ? -1 : node.height
  end

  def preorder
    accumulator = []
    preorder_helper(@root, accumulator)
    return accumulator
  end

  def preorder_helper(node, accumulator)
    return if node.nil?

    preorder_helper(node.left, accumulator)
    accumulator << node.value
    preorder_helper(node.right, accumulator)
  end

  def get(key)
    return get_helper(@root, key)
  end

  def get_helper(node, key)
    return nil if node.nil?

    if key < node.key
      return get_helper(node.left, key)
    elsif key > node.key
      return get_helper(node.right, key)
    else
      return node.value
    end
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
