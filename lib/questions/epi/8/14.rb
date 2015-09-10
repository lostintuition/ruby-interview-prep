#! /usr/bin/env ruby

# A postings list is a singly linked list with an additional "jump" field
# The "jump" field points to any other node
#
# Implement a function that takes a postings list and returns a copy of it.
# You can modify the original list but must restore it to its original state before returning

def copy_postings_list(list)
  create_merged_list(list)
  add_jumps(list)
  return split_list(list)
end

# create a copy of the list that is merged with the original list
# i.e. a -> a_copy -> b -> b_copy
# this allows a second iteration to reference the copy associated with the original
def create_merged_list(list)
  current_ptr = list
  while (!current_ptr.nil?)
    value = current_ptr.value
    next_node = current_ptr.next
    copy = new Node(value, next_node)

    current_ptr.next = copy
    current_ptr = copy.next
  end
end

# set the jump values for each copied node
def add_jumps(list)
  current_ptr = list
  while (!current_ptr.nil? && !current_ptr.next.nil?)
    # create copy
    copy = current_ptr.next

    # set the jump equal to the current's jump's copy
    copy.jump = current_ptr.jump.next

    # iterate to the next tuple
    current_ptr = current_ptr.next.next
  end
end

# split the list to revert the original and return the copy
def split_list(list)
  # return nil if the list is nil
  if (list.nil?)
    return nil
  end

  # set up the list copy head and the pointers to both lists
  list_copy = list.next
  copy_ptr = list_copy
  current_ptr = list

  # point each node to the next node in the list
  while (!current_ptr != nil && !copy_ptr.nil?)
    current_ptr.next = current_ptr.next.next
    current_ptr = current_ptr.next
    # if copy.next != nil, then point the node to the next node in the list
    # otherwise, the value is already nil so no work needs to be done
    if (!copy.next.nil?)
      copy.next = copy.next.next
    end
  end
  list_copy
end
