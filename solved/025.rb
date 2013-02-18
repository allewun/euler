def euler25
  # 6/22/12
  # What is the first term in the Fibonacci sequence to contain 1000 digits?

  fib = [1, 1]
  index = 2
  while fib[1].to_s.length < 1000
    fib = [fib[1], fib[0] + fib[1]]
    index += 1
  end
  index
end
