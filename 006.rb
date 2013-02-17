def euler6(num = 100)
  # 6/20/12
  # What is the difference between the sum
  # of the squares and the square of the sums?

  square_of_sum  = (1..num).reduce(:+) ** 2
  sum_of_squares = (1..num).inject { |sum, n| sum + n*n }

  return square_of_sum - sum_of_squares
end
