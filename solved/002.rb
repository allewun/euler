def euler2(max = 4_000_000)
  # 6/20/12
  # By considering the terms in the Fibonacci
  # sequence whose values do not exceed four
  # million, find the sum of the even-valued terms.

  sum = 0
  fib = [1, 1]
  while fib[1] < max
    sum += fib[1] if fib[1].even?
    fib = [fib[1], fib[0] + fib[1]]
  end
  sum
end