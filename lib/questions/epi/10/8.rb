#! /usr/bin/env ruby

require_relative "binary_tree"

# The direct implementation of an inorder traversal using recusion has O(h) space complexity, where h is the hight of the tree. Recursion can be removed with an explicit stack, but the space complexity remains O(h)
#
# Write a nonrecursive program for performing inorder traversal on a binary tree. Assume nodes have parent fields.

def in_order_stack(root)
  stack = Array.new
  current = root

  while (!stack.empty? || !current.nil?)
    if (!current.nil?)
      stack.push(current)
      current = current.left
    else
      current = stack.pop
      puts current.data
      current = current.right
    end
  end
end

def in_order_iterative(root)
  current = root
  traveling_down = true
  while (true)
    # traveling down simply iterates down the tree
    if (traveling_down)
      if (!current.left.nil?)
        current = current.left
        next
      else
        traveling_down = false
        next
      end
    end

    # traveling up will iterate up to the next node where it is possible to travel down
    # it will print all nodes along the way
    if (!traveling_down)
      puts current.data
      if (!current.right.nil?)
        current = current.right
        traveling_down = true
        next
      end
      while (!traveling_down)
        parent = current.parent
        if (parent.left == current)
          puts parent.data
          if (!parent.right.nil?)
            current = parent.right
            traveling_down = true
            next
          end
          current = parent
        end
        if (parent.right == current)
          if (parent == root)
            return
          end
          current = parent
          next
        end
      end
    end

  end
end

def in_order_iterative_1(root)
  prev_node = nil
  current_node = root
  while (!current_node.nil?)
    next_node = nil
    if current_node.parent == prev_node
      if !current_node.left.nil?
        next_node = current_node.left
      else
        puts current_node.data
        if (!current_node.right.nil?)
          next_node = current_node.right
        else
          next_node = current_node.parent
        end
      end
    elsif current_node.left == prev_node
      puts current_node.data
      if (!current_node.right.nil?)
        next_node = current_node.right
      else
        next_node = current_node.parent
      end
    else
      next_node = current_node.parent
    end

    prev_node = current_node
    current_node = next_node
  end
end

b = BinaryTree.new
b.set_up_example_tree

root = b.root

in_order_stack(root)
puts "\n\n\n\n"
in_order_iterative_1(root)
