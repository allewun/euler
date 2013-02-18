def euler3(num = 600851475143)
  # 2/16/13 - rewrite
  # The prime factors of 13195 are 5, 7, 13 and 29.
  # What is the largest prime factor of the number 600851475143?

  factors(num).last
end

def factors(num)
  if is_prime(num)
    [num]
  else
    pair = split(num)
    (factors(pair[0]) + factors(pair[1])).sort.uniq
  end
end

def is_prime(num)
  if num <= 3
    return true

  # trick from wikipedia
  elsif ((num + 1) % 6 != 0 and
         (num - 1) % 6 != 0)
    return false

  else
    (2..Math.sqrt(num).ceil).each do |x|
      return false if num % x == 0
    end
  end

  return true
end

def split(num)
  if num.even?
    return [2, num/2]
  else
    3.upto(num) do |i|
      return [i, num/i] if num % i == 0
    end
  end
end
