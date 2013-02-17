def euler20(n = 100)
  # 6/22/12
  # Find the sum of the digits in the number 100!

  def fact(x)
    ans = x.downto(1).reduce(:*)
  end
  fact(n).to_s.split('').map { |x| x.to_i}.reduce(:+)
end
