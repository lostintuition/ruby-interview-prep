#! /usr/bin/env ruby

class BalancedParentheses
  @@opening_to_closing_char = {
    "(" => ")",
    "{" => "}",
    "[" => "]"
  }

  def print_all_valid_combinations(total_pairs)
    accumulator = Array.new
    print_all_valid_combinations_helper(0, 0, "", total_pairs, accumulator)
    return accumulator
  end

  def validate_parentheses(paren_string)
    return false if paren_string.length % 2 != 0

    stack = Array.new
    paren_string.each_char do |char|
      if @@opening_to_closing_char.has_key?(char)
        stack.push(char)
      else
        opening_char = stack.pop
        if @@opening_to_closing_char[opening_char] != char
          return false
        end
      end
    end

    return stack.empty?
  end

  private
  def print_all_valid_combinations_helper(num_left_parentheses, num_right_parentheses, current_combination, total_pairs, accumulator)
    if num_left_parentheses == total_pairs && num_right_parentheses == total_pairs
      puts current_combination
      accumulator << current_combination
    end

    if num_left_parentheses > num_right_parentheses
      print_all_valid_combinations_helper(num_left_parentheses, num_right_parentheses + 1, current_combination + ")", total_pairs, accumulator)
    end

    if (num_left_parentheses < total_pairs)
      print_all_valid_combinations_helper(num_left_parentheses + 1, num_right_parentheses, current_combination + "(", total_pairs, accumulator)
    end
  end
end

balanced_parentheses = BalancedParentheses.new.print_all_valid_combinations(5)
puts balanced_parentheses
balanced_parentheses.each do |balanced_parenthesis|
  puts BalancedParentheses.new.validate_parentheses(balanced_parenthesis)
end
puts BalancedParentheses.new.validate_parentheses("()")
puts BalancedParentheses.new.validate_parentheses("()")
puts BalancedParentheses.new.validate_parentheses("())")
