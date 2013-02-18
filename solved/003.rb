
# 2/16/13 - rewrite
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?

def euler3(num = 600851475143)
  num.prime_factors.last
end
