#============================================================================
# euler024
# 2/23/13
#
# What is the millionth lexicographic permutation of the digits
# 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
#============================================================================

require 'set'

def euler024
  limit = (1..10).reduce(:*)
  num = "1234567890"

  s = Set.new
  until s.size == limit do
    p s.size
    s.add num
    num = num.split("").shuffle.join
  end

  s.to_a.sort[1000000 - 1]

end
