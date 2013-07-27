class Euclid
  def self.lowest_common_denominator(m, n)
    r = m % n
    while r != 0 do
      m = n
      n = r
      r = m % n
    end
    n
  end
end
