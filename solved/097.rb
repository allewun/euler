#============================================================================
# euler097
# 2/22/13
#
# ... However, in 2004 there was found a massive non-Mersenne
# prime which contains 2,357,207 digits: 28433 × 2^7830457 + 1.
# Find the last ten digits of this prime number.
#============================================================================

def euler097
  pow = ((2 ** 2000000) ** 2) * (2 ** (7830457 - 4000000))
  (28433 * pow + 1).to_s[-10,10].to_i
end
