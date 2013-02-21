#============================================================================
# euler005
# 6/20/12
#
# What is the smallest positive number that is
# evenly divisible by all of the numbers from 1 to 20?
#============================================================================

def euler005
  nums = (11..20)
  target = 20

  # how to do this part in ruby?
  while true
    good = true
    nums.each {
      |n|
      if target % n != 0
        good = false
        break
      end
    }
    if good
      return target
    else
      target += 1
    end
  end
end
