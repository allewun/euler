def euler1(max = 1000)
  # 6/20/12 - rewritten 2/17/13
  # Add all the natural numbers below one
  # thousand that are multiples of 3 or 5.

  (1...max).select { |i| i % 3 == 0 or i % 5 == 0 }.reduce(:+)
end
