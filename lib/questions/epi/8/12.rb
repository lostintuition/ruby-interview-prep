#! /usr/bin/env ruby

require_relative "linked_list"

# Let L be a singly linked list. Assume its nodes are numbered starting at 0.
# Define the even-odd merge of L to be the list consisting of the even-numbered nodes follow by the odd-numbered nodes.
# The even-odd merge is illustrated in Figure 8.10
#
# Write a function that computes the even-odd merge
# [0, 1, 2, 3, 4]

def compute_even_odd_merge(list)
  evens = nil
  odds = nil
  evens = list.head
  if (list.head == nil || list.head.next == nil)
    return evens
  end
  odds = list.head.next
  current_element = odds.next
  evens_tail, odds_tail = accumulate_evens_and_odds(evens, odds, current_element, true)
  evens_tail.next = odds
  evens
end

def accumulate_evens_and_odds(evens, odds, current_element, is_even)
  if (current_element == nil)
    odds.next = nil
    return [evens, odds]
  end

  if (is_even)
    evens.next = current_element
    evens = evens.next
  else
    odds.next = current_element
    odds = odds.next
  end

  return accumulate_evens_and_odds(evens, odds, current_element.next, !is_even)
end

linked_list = LinkedList.create(["0", "1", "2", "3", "4", "5"])

list = compute_even_odd_merge(linked_list)
current = list
while (current != nil)
  puts current
  current = current.next
end
