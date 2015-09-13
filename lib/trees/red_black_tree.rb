require_relative "node"

class RedBlackTree

  def put(key, value)
    @root = put(@root, key, value)
    @root.color = :black
  end

  def get(key)
    get_helper(@root, key)
  end

  private
  def get_helper(node, key)
    return nil if node.nil?

    if key < node.key
      return get_helper(node.left, key)
    elsif key > node.key
      return get_helper(node.right, key)
    else
      return node
    end
  end

  def put(node, key, value)
    return Node.new(key, value, :red) if node.nil?

    if key < node.key
      node.left = put(node.left, key, value)
    elsif key > node.key
      node.right = put(node.right, key, value)
    else
      node.value = value
    end

    node = rotateLeft(node) if isRed(node.right) && !isRed(node.left)
    node = rotateRight(node) if isRed(node.left) && isRed(node.left.left)
    node = flipColors(node) if isRed(node.left) && isRed(node.right)

    node.size = size(node.left) + size(node.right) + 1
    return node
  end

  def rotateLeft(node)
    root = node.right
    node.right = root.left
    root.left = node
    root.color = node.color
    node.color = :red
    root.size = node.size
    node.size = 1 + size(node.left) + size(node.right)
    return root
  end

  def rotateRight(node)
    root = node.left
    node.left = root.right
    root.right = node
    root.color = node.color
    node.color = :red
    root.size = node.size
    node.size = 1 + size(node.left) + size(node.right)
    return root
  end

  def flipColors(node)
    node.color = :red
    node.left.color = :black
    node.right.color = :black
  end

  def isRed(node)
    return node.color == :red
  end
end
