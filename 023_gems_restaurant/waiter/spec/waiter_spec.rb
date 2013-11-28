require 'waiter'

class Menu; end
class Chef; end

describe Waiter do
  let(:waiter) { Waiter.new(Menu.new) }
  let(:orders) { ['Salmon', 'Steak'] }
  let(:chef) { Chef.new }

  it "brings menus" do
    expect(waiter.bring_menu).to be_instance_of(Menu)
  end

  it "takes orders from customers" do
    expect(waiter.take_orders(orders)).to eq orders
  end

  it "brings orders to the chef" do
    waiter.take_orders(orders)
    expect(waiter.bring_orders_to_chef(chef)).to eq [chef, orders]
  end
end
