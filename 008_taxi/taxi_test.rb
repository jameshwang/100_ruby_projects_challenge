require 'minitest/autorun'
require_relative 'taxi'

describe Taxi do
  before do
    @car = Minitest::Mock.new
    @company = Minitest::Mock.new
    @taxi = Taxi.new(@car, @company)
  end

  it "should take a direction" do
    assert ["confirm", "please tell me more"], @taxi.provide_destination("2nd & Howard")
  end

  it "should start driving once it receives direction" do
    @taxi.provide_destination("2nd & Howard")
    @car.expect(:speed, 40) if @taxi.confirmed?
    assert @taxi.driving?
  end

  it "should ask for more help if the direction is confusing" do
    @taxi.provide_destination(nil)
    @car.expect(:speed, 0) unless @taxi.confirmed?
    refute @taxi.driving?
  end
end

# Test out more!!
describe Car do
  before do
    @car = Car.new("Toyota", "Prius", "Black")
  end
end

describe Direction do
  before do
    @direction = Direction.new
  end

  it "should provide direction routes if destination is known" do
    destination = "2nd & Howard"
    refute_nil @direction.get_direction(destination)
  end

  it "should confirm provide nil if destination is unknown" do
    destination = "2nd & Jimmaaayyy"
    assert_nil @direction.get_direction(destination)
  end
end
