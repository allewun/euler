#============================================================================
# euler009
# 3/1/13
#
# There exists exactly one Pythagorean triplet for which
# a + b + c = 1000, a^2 + b^2 = c^2
# Find the product abc.
#============================================================================

def euler009
  (1..999).each do |a|
    (a..999).each do |b|
      (b..999).each do |c|
        next if a + b + c != 1000
        return a*b*c if (a**2 + b**2 == c**2)
      end
    end
  end
end
