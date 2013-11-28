require_relative 'brain'

class Eye
  def see(scene)
    case scene
    when :fist
      Brain.new.saw_fist
    end
  end

  def saw(object)
    Brain.new.pick_up(object)
  end
end

Eye.new.see(:fist)
Eye.new.saw("Lamp")
