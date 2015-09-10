class BinaryTree
  attr_accessor :root

  def initialize
    @root = Node.new("1")
  end

  def set_up_example_tree
    node_two = Node.new("2")
    node_three = Node.new("3")
    node_four = Node.new("4")
    node_five = Node.new("5")
    node_six = Node.new("6")
    node_seven = Node.new("7")
    node_eight = Node.new("8")
    node_nine = Node.new("9")

    set_up_left_child(@root, node_two)
    set_up_left_child(node_two, node_three)
    set_up_right_child(node_two, node_four)
    set_up_right_child(@root, node_five)
    set_up_left_child(node_five, node_six)
    set_up_right_child(node_five, node_seven)
    set_up_left_child(node_six, node_eight)
    set_up_right_child(node_seven, node_nine)
  end

  def set_up_left_child(parent, child)
    parent.left = child
    child.parent = parent
  end

  def set_up_right_child(parent, child)
    parent.right = child
    child.parent = parent
  end

  def puts_in_order
    puts_in_order_helper(@root)
  end

  def puts_in_order_helper(node)
    if (node.nil?)
      return
    end
    puts_in_order_helper(node.left)
    puts node.data
    puts_in_order_helper(node.right)
  end
end

class Node
  attr_accessor :data, :left, :right, :parent

  def initialize(data)
    @data = data
  end

  def to_s
    data
  end
end
