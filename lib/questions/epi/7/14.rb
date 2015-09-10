#! /usr/bin/env ruby

# Given two strings s (the "search string") and t (the "text") find the first occurrence of s in t

def first_occurrence(search_string, text)
  i = 0
  while i < text.length
    if text[i] == search_string[0]
      if contains_substring(search_string, text, i)
        break
      else
        i += text.length
      end
    else
      i += 1
    end
  end
  i
end

def contains_substring(search_string, text, index)
  contains_substring = true
  (1..search_string.length - 1).each do |j|
    if search_string[j] == text[index + j]
      next
    else
      contains_substring = false
      break
    end
  end
  contains_substring
end

# contains_substring("bye", "hibyehibye", 2)
# contains_substring("bye", "hibyehibye", 3)

puts first_occurrence("bye", "hibye")

def try_to_do_this_shit
  if (s == "hi")

  end
end
