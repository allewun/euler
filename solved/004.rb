#============================================================================
# euler004
# 3/1/13
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#============================================================================

def euler004
  largest = 0

  (100..999).each do |x|
    (x..999).each do |y|
      prod = x * y
      largest = prod if prod > largest && prod.palindrome?
    end
  end

  largest
end
