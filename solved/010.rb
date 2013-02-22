#============================================================================
# euler010
# 2/21/13
#
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
#============================================================================

def euler010
  target = 2e6
  sum = 0

  each_prime do |p,i|
    break if p >= target
    sum += p
  end

  sum
end
