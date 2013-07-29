class Taxi
  attr_reader :car
  attr_accessor :direction
  def initialize(car, company)
    @car = car
    @company = company
    @direction = nil
  end

  def provide_destination(destination)
    self.direction = Direction.new.get_direction(destination)
    "confirm"
  end

  def driving?
    car.speed > 0
  end

  def confirmed?
    !!direction
  end
end

class Car
  attr_accessor :speed
  attr_reader :make, :model, :color

  def initialize(make, model, color)
    @speed = 0
    @make = make
    @model = model
    @color = color
  end

  def go
    self.speed = 40
  end

  def go_faster
    self.speed = 60
  end
end

class Direction
  def get_direction(destination)
    "go left on +++\ngo right on +++" if destination == "2nd & Howard"
  end
end
