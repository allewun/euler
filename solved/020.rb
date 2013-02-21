#============================================================================
# euler020
# 6/22/12
#
# Find the sum of the digits in the number 100!
#============================================================================

def soln
  def fact(x)
    ans = x.downto(1).reduce(:*)
  end
  fact(100).to_s.split('').map { |x| x.to_i}.reduce(:+)
end

#=====================================
# Run
#=====================================

es = EulerSolution.new({:soln => soln})
es.run
