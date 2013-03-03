# encoding: utf-8

#============================================================================
# Project Euler test harness
#============================================================================

class Euler
  def initialize(num, skip)
    @num     = num.to_i
    @skip    = skip || []
    @solved  =
      begin
        Hash[Dir["#{$SOLN_DIR}*"].map do |file|
          [file.match(/\d{3}/)[0].to_i, file]
        end]
      end
    @answers =
      begin
        Hash[File.open($ANS_FILE).each_line.map do |line|
          key, value = line.split(":")
          [key.to_i, value.to_i]
        end]
      end
  end

  def run_euler(num = @num, output = true)
    load "#{$SOLN_DIR}#{num_to_file(num)}"
    result = send(num_to_def(num))

    if output
      p result
    else
      result
    end
  end

  def run_all
    @solved.reject { |k,v| @skip.include? k }.each do |k,v|
      print num_to_file(k) + ': '
      run_euler(k)
    end
  end

  def test_euler(num = @num)
    computed = run_euler(num, false)
    actual = @answers[num]

    if (computed == actual)
      puts colorize("✓", GREEN) + "  (#{computed} == #{actual})"
    else
      puts colorize("✗", RED) + "  (#{computed} != #{actual})"
    end
  end

  def test_all
    @solved.reject { |k,v| @skip.include? k }.each do |k,v|
      print num_to_file(k) + ': '
      test_euler(k)
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
    print "\n\n  Solved #{@answers.size} problems.\n"
    print "  Attempted #{nums.size} problems.\n\n"
  end

  private

  def num_to_file(num)
    "#{num.zero_pad(3)}.rb"
  end

  def num_to_def(num)
    "euler#{num.zero_pad(3)}"
  end
end
