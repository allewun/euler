# Project Euler

# config
DATA_DIR   = 'data/'
SOLVED_DIR = 'solved/'

class Fixnum
  # prime number test
  def is_prime
    if self <= 3
      return true
    # trick from wikipedia
    elsif ((self + 1) % 6 != 0 and
           (self - 1) % 6 != 0)
      return false
    else
      (2..Math.sqrt(self).ceil).each do |x|
        return false if self % x == 0
      end
    end
    true
  end

  # returns all the prime factors of a number
  def prime_factors
    if is_prime
      [self]
    else
      pair = factorize
      (pair[0].prime_factors + pair[1].prime_factors).sort.uniq
    end
  end

  # returns one factorization of a number
  def factorize
    if even?
      return [2, self/2]
    else
      3.upto(self) do |i|
        return [i, self/i] if self % i == 0
      end
    end
  end
end

class File
  def File.open_euler(file)
    open "#{DATA_DIR}#{file}"
  end
end

############################
#  Project Euler interface
############################

def run_euler(hash, num)
  load hash[num]
  p send("euler#{num}")
end

# hash of solved problems
solved = Hash[Dir["#{SOLVED_DIR}*"].map { |a| [a.match(/[1-9]\d*/)[0].to_i, a] }]

puts
puts "*********************************************"
puts "                Project Euler                "
puts "*********************************************"
puts

skip = []

while true
  print "> "
  cmd = gets.chomp

  # run a solution
  if solved.has_key?(cmd.to_i)
    run_euler(solved, cmd.to_i)

  # skip solution
  elsif cmd[0] == 's'
    skip.push cmd.match(/\d+/)[0].to_i

  # clear skip list
  elsif cmd[0] == 'c'
    skip = []

  # run all solutions, but skip specified ones
  else
    solved.reject { |k,v| skip.include? k }.each do |k,v|
      puts "> #{k}"
      run_euler(solved, k)
    end
  end
end
