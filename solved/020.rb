#============================================================================
# euler020
# 6/22/12
#
# Find the sum of the digits in the number 100!
#============================================================================

def euler020
  def fact(x)
    ans = x.downto(1).reduce(:*)
  end
  fact(100).to_s.split('').map { |x| x.to_i}.reduce(:+)
end
