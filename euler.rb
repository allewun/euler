#!/usr/bin/env ruby

require 'rubygems'
require 'optparse'
require './EulerClasses'

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

euler = Euler.new(options[:n], options[:s])

if !options[:a].nil?
  euler.run_all
elsif !options[:n].nil?
  euler.run_euler
end
