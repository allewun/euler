# Project Euler

require './helpers/File'
require './helpers/Fixnum'

CONFIG = {}
CONFIG[:data]   = 'data/'
CONFIG[:solved] = 'solved/'



# run a particular solution
def run_euler(num, file, arg)
  load file
  if (arg.nil?)
    p send("euler#{num}")
  else
    p send("euler#{num}", arg)
  end
end

# hash of solved problems
solved = Hash[Dir["#{CONFIG[:solved]}*"].map { |a| [a.match(/[1-9]\d*/)[0].to_i, a] }]



#################
#  Begin prompt
#################
puts
puts "*********************************************"
puts "                Project Euler                "
puts "*********************************************"
puts

# list of problems to skip
skip = []

while true
  print "> "
  cmd = gets.chomp

  # run a solution
  if solved.has_key?(cmd.split[0].to_i)
    arg = (cmd.split.size == 2) ? cmd.split[1].to_i : nil
    run_euler(cmd.to_i, solved[cmd.to_i], arg)

  # add solution to skip
  elsif cmd[0] == 's'
    skip.push cmd.match(/\d+/)[0].to_i

  # clear skip list
  elsif cmd[0] == 'c'
    skip = []

  # run all solutions, but skip specified ones
  else
    solved.reject { |k,v| skip.include? k }.each do |k,v|
      puts "> #{k}"
      run_euler(k, solved[k])
      puts
    end
  end
end
