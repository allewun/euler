#============================================================================
# euler019
# 2/22/13
#
# How many Sundays fell on the first of the month during
# the twentieth century (1 Jan 1901 to 31 Dec 2000)?
#============================================================================

require 'date'

def euler019
  sundays = 0

  start  = Date.new(1901, 1, 1)
  finish = Date.new(2000, 12, 31)
  (start..finish).each do |d|
    sundays += 1 if d.day == 1 && d.sunday?
  end

  sundays
end
