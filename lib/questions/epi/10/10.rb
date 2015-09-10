#! /usr/bin/env ruby

require_relative "binary_tree"

# Given an inorder traversal sequence and a preorder traversal sequence of a binary tree, write a program to reconstruct the tree. Assume each node has a unique key.

def reconstruct_tree(inorder, preorder)
  if (inorder.nil? || preorder.nil?)
    return nil
  end

  # This is a leaf node. Return it immediately
  root = Node.new(preorder.first)
  if (inorder.size == 1)
    return root
  end

  root_index = get_root_index(inorder, preorder)

  lhs_inorder = get_lhs_inorder(inorder, root_index)
  rhs_inorder = get_rhs_inorder(inorder, root_index)
  lhs_preorder = get_lhs_preorder(preorder, root_index)
  rhs_preorder = get_rhs_preorder(preorder, root_index)

  root.left = reconstruct_tree(lhs_inorder, lhs_preorder)
  root.right = reconstruct_tree(rhs_inorder, rhs_preorder)

  return root
end


def get_root_index(inorder, preorder)
  root = preorder.first
  index = 0;
  while (root != inorder[index])
    index += 1;
  end

  index
end

def get_lhs_inorder(inorder, root_index)
  return inorder[0..root_index - 1]
end

def get_rhs_inorder(inorder, root_index)
  return inorder[root_index + 1..inorder.length]
end

def get_lhs_preorder(preorder, root_index)
  return preorder[1..root_index]
end

def get_rhs_preorder(preorder, root_index)
  return preorder[root_index + 1..preorder.length]
end

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

inorder = %w(3 2 4 1 8 6 5 7 9)
preorder = %w(1 2 3 4 5 6 8 7 9)

tree = reconstruct_tree(inorder, preorder)

in_order_stack(tree)
