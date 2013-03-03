#!/usr/bin/env ruby

require 'rubygems'
require 'optparse'
require './lib/Euler'
require './lib/helpers.rb'

$SOLN_DIR = "solved/"
$DATA_DIR = "data/"
$ANS_FILE = "test/answers.txt"

#============================================================================
# Parse command line options
#============================================================================

options = {}

optparse = OptionParser.new do |opts|
  opts.on('-a', '--all', 'Run all euler problems') do
    options[:a] = true
  end
  opts.on('-n', '--number N', 'Run euler problem N') do |o|
    options[:n] = o
  end
  opts.on('-s', '--skip A,B,C...', Array, 'Skip euler problems A,B,C...') do |s|
    options[:s] = s.map { |x| x.to_i }
  end
  opts.on('-l', '--list', 'List attempted solutions') do |l|
    options[:l] = true
  end
  opts.on('-t', '--test', 'Test euler problem(s) against known solution(s)') do |t|
    options[:t] = true
  end
  opts.on('-h', '--help', 'Show the help screen') do
    puts opts
    exit
  end
end.parse!

#============================================================================
# Run
#============================================================================

euler = Euler.new(options[:n], options[:s])

if !options[:t].nil?
  if !options[:a].nil?
    euler.test_all
  elsif !options[:n].nil?
    euler.test_euler
  end
elsif !options[:a].nil?
  euler.run_all
elsif !options[:n].nil?
  euler.run_euler
elsif !options[:l].nil?
  euler.list
end
