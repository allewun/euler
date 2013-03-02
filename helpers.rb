class File
  def File.open_euler(file)
    open "#{$DATA_DIR}#{file}"
  end
end

class Fixnum
  # prime number test
  def prime?
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
    if prime?
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

  # returns if number is divisible by a number
  def divisible?(n)
    self % n == 0
  end

  # returns if number is "palindromic"
  def palindrome?
    str = self.to_s
    len = str.size

    if len.odd?
      str[0, len/2] == str[len/2 + 1, len/2].reverse
    else
      str[0, len/2] == str[len/2, len/2].reverse
    end
  end

  # prepend with zeros
  def zero_pad(n)
    self.to_s.rjust(n, '0')
  end

  # prepend with spaces
  def space_pad(n)
    self.to_s.rjust(n, ' ')
  end
end

def each_prime
  # block parameters: |prime, index|

  index  = 1
  prime  = 2
  k      = 1  # all primes are of the form 6*k ± 1

  # first couple of primes don't follow 6*k ± 1 rule
  if index < 3
    if index == 1; yield 2,1; index += 1; end;
    if index == 2; yield 3,2; index += 1; end;
  end

  # use 6*k ± 1 rule to cut down on search time
  loop do
    candidates = [6*k - 1, 6*k + 1]

    if candidates[0].prime?
      prime = candidates[0]
      index += 1
      yield prime, index
    end

    if candidates[1].prime?
      prime = candidates[1]
      index += 1
      yield prime, index
    end

    k += 1
  end
end
