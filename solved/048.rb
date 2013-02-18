def euler48(n = 1000)
  # 6/22/12
  # Find the last ten digits of 1^1 + 2^2 + ... + 1000^1000.

  (1..n).each.reduce { |a,i| a + i**i }.to_s.slice(-10, 10)
end
