#! /usr/bin/env ruby

require_relative "binary_tree"

# The successor of a node in a binary tree is the node that appears immediately after the given node in an inorder traversal.
#
# Design an algorithm that computes the successor of a node in a binary tree. Assume that each node stores its parent

def inorder_successor(node)
  if (node.nil?)
    return
  end

  # node does not have a right subtree
  # go up until we hit an ancestor where the node is the left child of its parent
  if (node.right.nil?)
    current = node.parent
    while (!current.parent.nil? && current.parent == current.parent.right)
      current = current.parent
    end
    puts current.parent.data
  else
    # node does have a right subtree
    # the successor will be the left most node in the right subtree
    current = node.right
    while (!current.left.nil?)
      current = node.left
    end
    puts current
  end
end

b = BinaryTree.new
b.set_up_example_tree
