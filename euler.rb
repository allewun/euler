#!/usr/bin/env ruby

require 'rubygems'
require 'optparse'
require './helpers.rb'

$SOLN_DIR = "solved/"
$DATA_DIR = "data/"

#=============================
# Project Euler test harness
#=============================

class Euler
  def initialize(num, skip)
    @num    = num.to_i
    @skip   = skip || []
    @solved = Hash[Dir["#{$SOLN_DIR}*"].map { |a| [a.match(/[1-9]\d*/)[0].to_i, a] }].sort
  end

  def run_euler(num = @num)
    load "#{$SOLN_DIR}#{num_to_file(num)}"
    p send(num_to_def(num))
  end

  def run_all
    @solved.reject { |k,v| @skip.include? k }.each do |k,v|
      print num_to_file(k) + ': '
      run_euler(k)
    end
  end

  private

  def num_to_file(num)
    "#{num.to_s.rjust(3, '0')}.rb"
  end

  def num_to_def(num)
    "euler#{num.to_s.rjust(3, '0')}"
  end
end

#=============================
# Parse command line options
#=============================

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
  opts.on('-h', '--help', 'Show the help screen') do
    puts opts
    exit
  end
end.parse!

#=============================
# Run
#=============================

euler = Euler.new(options[:n], options[:s])

if !options[:a].nil?
  euler.run_all
elsif !options[:n].nil?
  euler.run_euler
end
