#============================================================================
# euler042
# 6/22/12
#
# How many "triangle" words?
#============================================================================

def euler042
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
  File.open_euler('words.txt').each_line do |line|
    line_words = line.split(',')
    line_words.each { |w| triangle_count += 1 if isTriangle(w.gsub(/[^A-Z]/, '')) }
  end

  triangle_count
end
