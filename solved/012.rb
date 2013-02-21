#============================================================================
# euler012
# 6/25/12 - O(N^2)... too slow, need to optimize
#
# What is the value of the first triangle number
# to have over five hundred divisors?
#============================================================================

def euler012
  def divisor_count(n)
    return 0 if n < 500

    divisor_count = 0
    1.upto(n/2).each { |x| divisor_count += 1 if n % x == 0 }
    divisor_count += 1 # for itself

  end

  current_triangle_num = current_triangle_index = 1

  until divisor_count(current_triangle_num) >= 500
    current_triangle_index += 1
    current_triangle_num += current_triangle_index
  end

  current_triangle_num
end
