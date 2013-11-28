class Waiter
  def initialize(menu)
    @menu = menu
  end

  def bring_menu
    @menu
  end

  def take_orders(orders)
    @orders = orders
  end

  def bring_orders_to_chef(chef)
    [chef, @orders]
  end
end
