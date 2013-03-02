#============================================================================
# Project Euler test harness
#============================================================================

class Euler
  def initialize(num, skip)
    @num    = num.to_i
    @skip   = skip || []
    @solved = Hash[Dir["#{$SOLN_DIR}*"].map { |a| [a.match(/[1-9]\d*/)[0].to_i, a] }].sort
  end

  def run_euler(num = @num)
    load "#{$SOLN_DIR}#{num_to_file(num)}"
    p send(num_to_def(num))
  end

  def run_all
    @solved.reject { |k,v| @skip.include? k }.each do |k,v|
      print num_to_file(k) + ': '
      run_euler(k)
    end
  end

  def list
    nums = @solved.to_a.map { |k,v| k }
    table = "\n"

    (0..30).each do |x|
      (1..10).each do |y|
        cur = 10*x + y

        # skip 000
        next if cur == 0

        # stop printing after the last row of attempted solutions
        break if x > (nums.max - 1) / 10

        # print table entry
        if nums.include? cur
          table << "#{cur.space_pad(3)} "
        else
          table << "  . "
        end
      end

      # new row
      table << "\n"
    end

    print table.rstrip
    print "\n\n  Attempted #{nums.size} problems.\n\n"
  end

  private

  def num_to_file(num)
    "#{num.zero_pad(3)}.rb"
  end

  def num_to_def(num)
    "euler#{num.zero_pad(3)}"
  end
end
