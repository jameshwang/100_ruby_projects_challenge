class Plane
  attr_reader :make, :model
  attr_accessor :crew, :pilots

  def initialize(make, model)
    @make, @model = make, model
  end

  def fly
    raise RuntimeError, "Error: Crew not found" unless crew
    raise RuntimeError, "Error: Pilots not found" unless pilots
  end
end
