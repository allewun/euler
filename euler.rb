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

  def list
    nums = @solved.to_a.map { |k,v| k }
    table = "\n"

    (0..30).each do |x|
      (1..10).each do |y|
        cur = 10*x + y

        # skip 000
        if cur == 0
          next
        end

        # stop printing after the last row of attempted solutions
        if x > (nums.max - 1) / 10
          break
        end

        # print table entry
        if nums.include? cur
          table << "#{cur.space_pad(3)} "
        else
          table << "  . "
        end
      end

      # new row
      table << "\n"
    end

    print table.rstrip
    print "\n\n  Attempted #{nums.size} problems.\n\n"
  end

  private

  def num_to_file(num)
    "#{num.zero_pad(3)}.rb"
  end

  def num_to_def(num)
    "euler#{num.zero_pad(3)}"
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
  opts.on('-l', '--list', 'List attempted solutions') do |l|
    options[:l] = true
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
elsif !options[:l].nil?
  euler.list
end
