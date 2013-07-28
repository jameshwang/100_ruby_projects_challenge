class PlayDateTime
  def today
    Date.today
  end

  def tomorrow
    today + 1
  end

  def yesterday
    today - 1
  end
end
