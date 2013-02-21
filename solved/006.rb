#============================================================================
# euler006
# 6/20/12
#
# What is the difference between the sum
# of the squares and the square of the sums?
#============================================================================

def soln
  square_of_sum  = (1..100).reduce(:+) ** 2
  sum_of_squares = (1..100).inject { |sum, n| sum + n*n }

  return square_of_sum - sum_of_squares
end

#=====================================
# Run
#=====================================

es = EulerSolution.new({:soln => soln})
es.run
