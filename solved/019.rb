#============================================================================
# euler019
# 2/22/13
#
# How many Sundays fell on the first of the month during
# the twentieth century (1 Jan 1901 to 31 Dec 2000)?
#============================================================================

class EulerDate

  SUNDAY    = 0
  MONDAY    = 1
  TUESDAY   = 2
  WEDNESDAY = 3
  THURSDAY  = 4
  FRIDAY    = 5
  SATURDAY  = 6

  attr_reader :year, :month, :day, :day_of_week

  def initialize(year, month, day, day_of_week)
    @year = year
    @month = month
    @day = day
    @day_of_week = day_of_week
  end

  def sunday?
    @day_of_week == SUNDAY
  end

  def leap_year?
    @year.divisible?(4) && (!@year.divisible?(100) || @year.divisible?(400))
  end

  def days_in_month
    if @month == 1 && leap_year?
      29
    else
      [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][@month - 1]
    end
  end

  def next
    if @day == days_in_month
      @year += 1 if @month == 12
      @month = (@month % 12) + 1
      @day = 1
    else
      @day += 1
    end

    @day_of_week = (@day_of_week + 1) % 7
  end
end

def euler019
  sundays = 0

  d = EulerDate.new(1900, 1, 1, 1)
  until (d.year == 2000 && d.month == 12 && d.day == 31) do
    sundays += 1 if d.sunday? && d.day == 1 && d.year >= 1901
    d.next
  end

  sundays
end
