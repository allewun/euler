#============================================================================
# euler005
# 6/20/12, 3/1/13 rewritten
#
# What is the smallest positive number that is
# evenly divisible by all of the numbers from 1 to 20?
#============================================================================

def euler005
  num = 2

  loop do
    if num.divisible?(19) &&
       num.divisible?(17) &&
       num.divisible?(13) &&
       num.divisible?(11) &&
       num.divisible?(12) &&
       num.divisible?(14) &&
       num.divisible?(15) &&
       num.divisible?(16) &&
       num.divisible?(18) &&
       num.divisible?(20)
      return num
    else
      num += 2 # only consider even numbers
    end
  end
end
