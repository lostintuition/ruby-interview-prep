#! /usr/bin/env ruby

# A string over the characters "(,),(,),[,]" is said to be well formed if the different types of brackers match in the correct order.
# For example, "([]){()}" is well-formed, as is "[()[]{()()}]". However "({)" and "[()[[{()()" are not well-formed"
#
# Write a function that tests if a string made up of the characters '(', ')', '[', ']', '{', and '}' are is well-formed

@opening_chars = ["(", "{", "["]
@closing_char_to_opening_char = {
  "}" => "{",
  "]" => "[",
  ")" => "("
}

def well_formed?(s)
  array = Array.new
  s.chars.each do |char|
    if (@opening_chars.include?(char))
      array.push(char)
    else
      opening_char = @closing_char_to_opening_char[char]
      if (opening_char != array.pop)
        return false
      end
    end
  end
  return array.empty?
end

puts well_formed?("({}{)")
