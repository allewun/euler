#============================================================================
# euler028
# 2/24/13
#
#
# Starting with the number 1 and moving to the right in a clockwise
# direction a 5 by 5 spiral is formed as follows:
#
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral
# formed in the same way?
#============================================================================

def euler028
  size = 1001

  # diagonal in quadrant I contains perfect squares
  # ex: q1 = [1^2, 3^2, 5^2, ... , n^2] = [1, 9, 25, ... , n^2]
  q1 = (1..size).step(2).map { |x| x**2 }

  # diagonal in quadrant II contains q1's values, but
  # q2's nth value is q1's nth value minus 2*n (n is 0-based)
  # ex: q2 = [1^2 - 2*0, 3^2 - 2*1, 5^2 - 2*2, ...] = [1, 7, 21 ...]
  q2 = q1.each_with_index.map { |x,i| x - 2*i }

  # the pattern continues for q3 and q4
  q3 = q2.each_with_index.map { |x,i| x - 2*i }
  q4 = q3.each_with_index.map { |x,i| x - 2*i }

  # add all values, but don't add the initial "1" again
  (q1 + q2 + q3 + q4).reduce(:+) - 3
end
