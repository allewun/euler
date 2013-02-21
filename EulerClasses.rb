require './helpers.rb'

$SOLN_DIR = "solved/"
$DATA_DIR = "data/"

class Euler
  def initialize(num, skip)
    @num    = num.to_i
    @skip   = skip || []
    @solved = Hash[Dir["#{$SOLN_DIR}*"].map { |a| [a.match(/[1-9]\d*/)[0].to_i, a] }].sort
  end

  def run_euler(num = @num)
    load "#{$SOLN_DIR}#{num_to_file(num)}"
  end

  def run_all
    @solved.reject { |k,v| @skip.include? k }.each do |k,v|
      print num_to_file(k) + ': '
      run_euler(k)
    end
  end

  private

  def num_to_file(num)
    num.to_s.rjust(3, '0') + '.rb'
  end
end


class EulerSolution
  attr_accessor :soln

  def initialize(args)
    @soln = args[:soln]
  end

  def run
    p @soln.send(:soln)
  end
end
