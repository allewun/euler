def euler3(num = 600851475143)
  # 1/16/13 (took about 50 minutes... correct, but algorithm takes too long to finish!
  # Factorization tree seems like it will be more efficient)
  # The prime factors of 13195 are 5, 7, 13 and 29.
  # What is the largest prime factor of the number 600851475143?

  # generate sieve
  require 'set'

  sieve = Set.new
  primes = Set.new

  (2..num/2).each do |i|
    primes.add(i) if !sieve.include? i

    (i*2..num/2).step(i) do |multiple|
      sieve.add(multiple)
    end
  end

  # collect primes from sieve
  newprimes = (2..num/2).to_set - sieve

  primes = newprimes + primes
  primes = primes.to_a.sort.reverse

  primes.each do |prime|
    break prime if num % prime == 0
  end
end
