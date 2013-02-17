def euler16
  # 6/22/12
  # What is the sum of the digits of the number 2^1000?

  (2 ** 1000).to_s.split('').map { |x| x.to_i }.reduce(:+)
end
