class File
  def File.open_euler(file)
    open "#{$DATA_DIR}#{file}"
  end
end

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