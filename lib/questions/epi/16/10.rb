#! /usr/bin/env ruby

# Write a program which takes n as input and returns an n-bit Gray code.

def generate_n_bit_gray_codes(n)
  if (n == 0)
    return [0]
  end

  if (n == 1)
    return [0, 1]
  end

  n_minus_one_bit_gray_codes = generate_n_bit_gray_codes(n - 1)
  leading_bit_one = 1 << (n - 1)
  n_minus_one_bit_gray_codes.reverse.each do |gray_code|
    n_minus_one_bit_gray_codes.push(leading_bit_one | gray_code)
  end

  n_minus_one_bit_gray_codes
end

gray_codes = generate_n_bit_gray_codes(3)
gray_codes.each do |gray_code|
  puts gray_code.to_s(2)
end
