require 'date'

class Appointment
  def make(appointment)
    return self
  end

  def day_to_date(day_string)
    days_of_week = {
      1 => ["mon", "monday"],
      2 => ["tues", "tuesday"],
      3 => ["wed", "wednesday"],
      4 => ["thurs", "thur", "thursday"],
      5 => ["fri", "friday"],
      6 => ["sat", "saturday"],
      7 => ["sun", "sunday"]
    }

    days_of_week.each_pair do |key, value|
      return key if value.include? day_string.downcase
    end
    return 0
  end

  def next_week_from(day_string)
    day_of_week = day_to_date(day_string)
    Date.today.cwday + x % 7 = day_of_week
  end
end

