#============================================================================
# euler079
# 6/25/12 - this one was fun
#
# By analysing a user's login attempts, can
# you determine the secret numeric passcode?
#============================================================================

def euler079
  inputs = []
  File.open_euler('keylog.txt').each_line do |line|
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
