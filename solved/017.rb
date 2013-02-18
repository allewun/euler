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
