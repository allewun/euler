#============================================================================
# euler024
# 2/23/13
#
# What is the millionth lexicographic permutation of the digits
# 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
#============================================================================

def euler024
  limit = (1..10).reduce(:*)
  num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

  num.permutation.map { |x| x.join.to_i }.sort[1000000 - 1]

end
