def euler1(max = 1000)
  # 6/20/12
  # Add all the natural numbers below one
  # thousand that are multiples of 3 or 5.

    sum = 0
    max.times { |x| sum += x if x % 3 == 0 and x % 5 == 0 }
    sum
end

def euler2(max = 4_000_000)
  # 6/20/12
  # By considering the terms in the Fibonacci
  # sequence whose values do not exceed four
  # million, find the sum of the even-valued terms.

  sum = 0
  fib = [1, 1]
  while fib[1] < max
    sum += fib[1] if fib[1].even?
    fib = [fib[1], fib[0] + fib[1]]
  end
  sum
end

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

p euler3(13195)

def euler5
  # 6/20/12
  # What is the smallest positive number that is
  # evenly divisible by all of the numbers from 1 to 20?

  nums = (11..20)
  target = 20

  # how to do this part in ruby?
  while true
    good = true
    nums.each {
      |n|
      if target % n != 0
        good = false
        break
      end
    }
    if good
      return target
    else
      target += 1
    end
  end
end

def euler6(num = 100)
  # 6/20/12
  # What is the difference between the sum
  # of the squares and the square of the sums?

  square_of_sum  = (1..num).reduce(:+) ** 2
  sum_of_squares = (1..num).inject { |sum, n| sum + n*n }

  return square_of_sum - sum_of_squares
end

def euler8
  # 6/22/12
  # Find the greatest product of five consecutive
  # digits in the 1000-digit number.

  big_num = <<-eos
    73167176531330624919225119674426574742355349194934
    96983520312774506326239578318016984801869478851843
    85861560789112949495459501737958331952853208805511
    12540698747158523863050715693290963295227443043557
    66896648950445244523161731856403098711121722383113
    62229893423380308135336276614282806444486645238749
    30358907296290491560440772390713810515859307960866
    70172427121883998797908792274921901699720888093776
    65727333001053367881220235421809751254540594752243
    52584907711670556013604839586446706324415722155397
    53697817977846174064955149290862569321978468622482
    83972241375657056057490261407972968652414535100474
    82166370484403199890008895243450658541227588666881
    16427171479924442928230863465674813919123162824586
    17866458359124566529476545682848912883142607690042
    24219022671055626321111109370544217506941658960408
    07198403850962455444362981230987879927244284909188
    84580156166097919133875499200524063689912560717606
    05886116467109405077541002256983155200055935729725
    71636269561882670428252483600823257530420752963450
  eos

  # cut-out 5 digit numbers that straddle a zero
  # to reduce computation later
  #4.times { big_num.gsub!(/[1-9]0/, '0').gsub!(/0[1-9]/, '0') }
  #big_num.gsub!(/0/, '')

  current_max = 0

  until big_num.length == 5 do
    current_prod = big_num[0..4].split('').map { |i| i.to_i }.reduce(:*)
    current_max = current_prod if current_prod > current_max
    big_num = big_num[1..-1]
  end

  current_max
end

def euler12
  # 6/25/12 - brute force. O(n^2)... need to find optimized method... taking
  # too long to compute.
  #
  # What is the value of the first triangle number
  # to have over five hundred divisors?

  def divisor_count(n)
    return 0 if n < 500

    divisor_count = 0
    1.upto(n/2).each { |x| divisor_count += 1 if n % x == 0 }
    divisor_count += 1 # for itself

  end

  current_triangle_num = current_triangle_index = 1

  until divisor_count(current_triangle_num) >= 500
    current_triangle_index += 1
    current_triangle_num += current_triangle_index
  end

  current_triangle_num
end

def euler13
  # 6/22/12
  # Work out the first ten digits of the sum of the
  # following one-hundred 50-digit numbers.

  numbers = <<-eos
    37107287533902102798797998220837590246510135740250
    46376937677490009712648124896970078050417018260538
    74324986199524741059474233309513058123726617309629
    91942213363574161572522430563301811072406154908250
    23067588207539346171171980310421047513778063246676
    89261670696623633820136378418383684178734361726757
    28112879812849979408065481931592621691275889832738
    44274228917432520321923589422876796487670272189318
    47451445736001306439091167216856844588711603153276
    70386486105843025439939619828917593665686757934951
    62176457141856560629502157223196586755079324193331
    64906352462741904929101432445813822663347944758178
    92575867718337217661963751590579239728245598838407
    58203565325359399008402633568948830189458628227828
    80181199384826282014278194139940567587151170094390
    35398664372827112653829987240784473053190104293586
    86515506006295864861532075273371959191420517255829
    71693888707715466499115593487603532921714970056938
    54370070576826684624621495650076471787294438377604
    53282654108756828443191190634694037855217779295145
    36123272525000296071075082563815656710885258350721
    45876576172410976447339110607218265236877223636045
    17423706905851860660448207621209813287860733969412
    81142660418086830619328460811191061556940512689692
    51934325451728388641918047049293215058642563049483
    62467221648435076201727918039944693004732956340691
    15732444386908125794514089057706229429197107928209
    55037687525678773091862540744969844508330393682126
    18336384825330154686196124348767681297534375946515
    80386287592878490201521685554828717201219257766954
    78182833757993103614740356856449095527097864797581
    16726320100436897842553539920931837441497806860984
    48403098129077791799088218795327364475675590848030
    87086987551392711854517078544161852424320693150332
    59959406895756536782107074926966537676326235447210
    69793950679652694742597709739166693763042633987085
    41052684708299085211399427365734116182760315001271
    65378607361501080857009149939512557028198746004375
    35829035317434717326932123578154982629742552737307
    94953759765105305946966067683156574377167401875275
    88902802571733229619176668713819931811048770190271
    25267680276078003013678680992525463401061632866526
    36270218540497705585629946580636237993140746255962
    24074486908231174977792365466257246923322810917141
    91430288197103288597806669760892938638285025333403
    34413065578016127815921815005561868836468420090470
    23053081172816430487623791969842487255036638784583
    11487696932154902810424020138335124462181441773470
    63783299490636259666498587618221225225512486764533
    67720186971698544312419572409913959008952310058822
    95548255300263520781532296796249481641953868218774
    76085327132285723110424803456124867697064507995236
    37774242535411291684276865538926205024910326572967
    23701913275725675285653248258265463092207058596522
    29798860272258331913126375147341994889534765745501
    18495701454879288984856827726077713721403798879715
    38298203783031473527721580348144513491373226651381
    34829543829199918180278916522431027392251122869539
    40957953066405232632538044100059654939159879593635
    29746152185502371307642255121183693803580388584903
    41698116222072977186158236678424689157993532961922
    62467957194401269043877107275048102390895523597457
    23189706772547915061505504953922979530901129967519
    86188088225875314529584099251203829009407770775672
    11306739708304724483816533873502340845647058077308
    82959174767140363198008187129011875491310547126581
    97623331044818386269515456334926366572897563400500
    42846280183517070527831839425882145521227251250327
    55121603546981200581762165212827652751691296897789
    32238195734329339946437501907836945765883352399886
    75506164965184775180738168837861091527357929701337
    62177842752192623401942399639168044983993173312731
    32924185707147349566916674687634660915035914677504
    99518671430235219628894890102423325116913619626622
    73267460800591547471830798392868535206946944540724
    76841822524674417161514036427982273348055556214818
    97142617910342598647204516893989422179826088076852
    87783646182799346313767754307809363333018982642090
    10848802521674670883215120185883543223812876952786
    71329612474782464538636993009049310363619763878039
    62184073572399794223406235393808339651327408011116
    66627891981488087797941876876144230030984490851411
    60661826293682836764744779239180335110989069790714
    85786944089552990653640447425576083659976645795096
    66024396409905389607120198219976047599490197230297
    64913982680032973156037120041377903785566085089252
    16730939319872750275468906903707539413042652315011
    94809377245048795150954100921645863754710598436791
    78639167021187492431995700641917969777599028300699
    15368713711936614952811305876380278410754449733078
    40789923115535562561142322423255033685442488917353
    44889911501440648020369068063960672322193204149535
    41503128880339536053299340368006977710650566631954
    81234880673210146739058568557934581403627822703280
    82616570773948327592232845941706525094512325230608
    22918802058777319719839450180888072429661980811197
    77158542502016545090413245809786882778948721859617
    72107838435069186155435662884062257473692284509516
    20849603980134001723930671666823555245252804609722
    53503534226472524250874054075591789781264330331690
  eos

  answer = numbers.lines.each.map { |x| x.to_i }.reduce(:+).to_s[0..9]
end

def euler16
  # 6/22/12
  # What is the sum of the digits of the number 2^1000?

  (2 ** 1000).to_s.split('').map { |x| x.to_i }.reduce(:+)
end

def euler17
  # 6/22/12
  # If all the numbers from 1 to 1000 (one thousand) inclusive
  # were written out in words, how many letters would be used?

  def split_number(num)
    num = num.to_s.rjust(4, '0')
    {
      :thousands => num[0].chr.to_i,
      :hundreds => num[1].chr.to_i,
      :tens => num[2].chr.to_i,
      :ones => num[3].chr.to_i
    }
  end

  dict = {
    1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five',
    6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten',
    11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen',
    15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen',
    19 => 'nineteen', 20 => 'twenty', 30 => 'thirty', 40 => 'forty',
    50 => 'fifty', 60 => 'sixty', 70 => 'seventy', 80 => 'eighty',
    90 => 'ninety', 100 => 'hundred', 1000 => 'thousand'
  }

  sum = 0
  (1..1000).each do |x|
    num = split_number(x)
    word = ''

    # thousands
    if num[:thousands] > 0
      word << dict[num[:thousands]] + ' ' + dict[1000] + ' '
    end

    # hundreds
    if num[:hundreds] > 0
      word << dict[num[:hundreds]] + ' ' + dict[100] + ' '
    end

    tens_ones = 10*num[:tens] + num[:ones]

    # tens (20-99)
    if (2..9) === num[:tens]
      word << 'and ' if word.length > 0
      word << dict[10*num[:tens]]
      word << dict[num[:ones]] if num[:ones] > 0
    # teens (1-19)
    elsif tens_ones > 0
      word << 'and ' if word.length > 0
      word << dict[tens_ones]
    end

    sum += word.gsub(/[^a-z]/, '').length
  end

  sum
end

def euler20(n = 100)
  # 6/22/12
  # Find the sum of the digits in the number 100!

  def fact(x)
    ans = x.downto(1).reduce(:*)
  end
  fact(n).to_s.split('').map { |x| x.to_i}.reduce(:+)
end

def euler22
  # 6/22/12
  # What is the total of all the name scores in the file?

  def find_score(word)
    score = 0
    word.split('').each { |l| score += l[0].ord - 64 } # 64 is the offset to
                                                       # convert uppercase ASCII
                                                       # to alphabetical indices
    score
  end

  names = []
  File.open('names.txt').each_line do |line|
    line_names = line.split(',')
    line_names.each { |n| names.push(n.gsub(/[^A-Z]/, '')) }
  end
  names.sort!

  score = 0
  names.each_with_index do |name, i|
    position = i+1
    score += find_score(name) * position
  end
  score
end

def euler25
  # 6/22/12
  # What is the first term in the Fibonacci sequence to contain 1000 digits?

  fib = [1, 1]
  index = 2
  while fib[1].to_s.length < 1000
    fib = [fib[1], fib[0] + fib[1]]
    index += 1
  end
  index
end

def euler29
  # 6/22/12
  # How many distinct terms are in the sequence
  # generated by a^b for 2 ≤ a ≤ 100 and 2 ≤ b ≤ 100?

  list = []
  (2..100).each do |a|
    (2..100).each { |b| list.push(a ** b) }
  end
  list.uniq!.count
end

def euler33
  # 6/23/12
  # Discover all the fractions with an unorthodox cancelling method.

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

def euler34
end

def euler42
  # 6/22/12
  # How many "triangle" words?

  def isTriangle(word)
    word_val = 0
    word_val = word.split('').each.reduce(0) { |a, c| a + (c[0].ord - 64) }

    t_n, n = 1, 1
    while t_n < word_val
      n += 1
      t_n = (n * (n + 1)) / 2
    end

    return word_val == t_n
  end

  triangle_count = 0
  File.open('words.txt').each_line do |line|
    line_words = line.split(',')
    line_words.each { |w| triangle_count += 1 if isTriangle(w.gsub(/[^A-Z]/, '')) }
  end

  triangle_count
end

def euler48(n = 1000)
  # 6/22/12
  # Find the last ten digits of 1^1 + 2^2 + ... + 1000^1000.

  (1..n).each.reduce { |a,i| a + i**i }.to_s.slice(-10, 10)
end

def euler79
  # 6/25/12 - this one was fun
  # By analysing a user's login attempts, can
  # you determine the secret numeric passcode?

  inputs = []
  File.open('keylog.txt').each_line do |line|
    inputs.push(line.chomp)
  end
  inputs.uniq!.sort!

  # create hash of all the numbers that exist
  proceeded_freq = inputs.join.split('').uniq.sort.reduce({}) { |a,n| a[n] = []; a }

  # populate the hash, for each key, the value is the numbers that follow it
  inputs.each do |n|
    proceeded_freq[n[0].chr].push(n[1].chr)
    proceeded_freq[n[0].chr].push(n[2].chr)
    proceeded_freq[n[1].chr].push(n[2].chr)
  end

  proceeded_freq.map { |k,v| v = v.uniq! }
  proceeded_freq = proceeded_freq.sort_by { |k,v| v.length }.reverse

  answer = proceeded_freq.reduce("") { |a, n| a << n[0] }
end
