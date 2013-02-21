#============================================================================
# euler022
# 6/22/12
#
# What is the total of all the name scores in the file?
#============================================================================

def euler022
  def find_score(word)
    score = 0
    word.split('').each { |l| score += l[0].ord - 64 } # 64 is the offset to
                                                       # convert uppercase ASCII
                                                       # to alphabetical indices
    score
  end

  names = []
  File.open_euler('names.txt').each_line do |line|
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
