class Inventory
  def initialize
    @inventory = Hash.new(0)
  end
  def add(object)
    @inventory[object] += 1
    object
  end

  def all
    @inventory.keys
  end

  def all_with_count
    @inventory
  end
end
