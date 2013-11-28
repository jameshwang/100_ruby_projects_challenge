require_relative 'hand'

class Brain
  def saw_fist
    Hand.new.block
  end

  def pick_up(object)
    Hand.new.pick_up(object)
  end
end
