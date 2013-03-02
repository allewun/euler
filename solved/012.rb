#============================================================================
# euler012
# 6/25/12, 3/1/13 rewritten
#
# What is the value of the first triangle number
# to have over five hundred divisors?
#============================================================================

def euler012
  each_triangle_number do |n, index|
    return n if n.factors.size > 500
  end
end
