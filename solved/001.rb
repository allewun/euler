#============================================================================
# euler001
# 6/20/12
#
# Add all the natural numbers below one
# thousand that are multiples of 3 or 5.
#============================================================================

def euler001
  (1...1000).select { |i| i % 3 == 0 or i % 5 == 0 }.reduce(:+)
end
