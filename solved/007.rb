#============================================================================
# euler007
# 2/21/13
#
# What is the 10 001st prime number?
#============================================================================

def euler007
  target = 10_001
  index  = 3 - 1  # start at 3rd prime number (5)
  prime  = 5
  k      = 1      # all primes are of the form 6*k ± 1

  loop do
    candidates = [6*k - 1, 6*k + 1]

    if candidates[0].is_prime?
      prime = candidates[0]
      index += 1
      return prime if index == target
    end

    if candidates[1].is_prime?
      prime = candidates[1]
      index += 1
      return prime if index == target
    end

    k += 1
  end
end
