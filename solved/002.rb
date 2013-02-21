#============================================================================
# euler002
# 6/20/12
#
# By considering the terms in the Fibonacci
# sequence whose values do not exceed four
# million, find the sum of the even-valued terms.
#============================================================================

def soln
  sum = 0
  fib = [1, 1]
  while fib[1] < 4e6
    sum += fib[1] if fib[1].even?
    fib = [fib[1], fib[0] + fib[1]]
  end
  sum
end

#=====================================
# Run
#=====================================

es = EulerSolution.new({:soln => soln})
es.run
