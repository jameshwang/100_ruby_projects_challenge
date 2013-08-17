class Crew
  attr_accessor :personnel_list, :plane

  def board_plane(plane)
    plane.crew = self
  end

  def clean_plane(plane)
    plane.clean = true
  end
end
