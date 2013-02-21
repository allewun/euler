#============================================================================
# euler033
# 6/23/12
#
# Discover all the fractions with an unorthodox cancelling method.
#============================================================================

def soln
  answers = []
  11.upto(99) do |den|
    10.upto(den - 1) do |num|
      n = num.to_s
      d = den.to_s

      # cancel matches
      trimmed = false
      num.to_s.split('').each do |x|
        if den.to_s.include?(x)
          n.sub!(x, '')
          d.sub!(x, '')
          trimmed = true
        end
      end

      # add fraction if non-trivial (doesn't end with '0') and if
      # new and old fractions match
      if trimmed and
        n.to_f > 0 and d.to_f > 0 and
        num.to_f % 10 != 0 and den.to_f % 10 != 0 and
        (num.to_f / den.to_f) == (n.to_f / d.to_f)
        answers.push([num.to_f, den.to_f])
      end
    end
  end

  # multiply all fractions together
  prod = answers.reduce(1) { |a, i| a * (i[0]/i[1]) }
end

#=====================================
# Run
#=====================================

es = EulerSolution.new({:soln => soln})
es.run
