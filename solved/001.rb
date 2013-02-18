def euler1(max = 1000)
  # 6/20/12
  # Add all the natural numbers below one
  # thousand that are multiples of 3 or 5.

    sum = 0
    max.times { |x| sum += x if x % 3 == 0 and x % 5 == 0 }
    sum
end
