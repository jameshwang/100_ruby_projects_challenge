require 'minitest/autorun'
require_relative 'plane'

describe Plane do
  before do
    @model = "787"
    @make = "Boeing"
    @plane = Plane.new(@make, @model)
  end
  it "should start with a model and make" do
    refute_nil @plane
  end

  it "should know its make" do
    assert_equal @make, @plane.make
  end

  it "should know its model" do
    assert_equal @model, @plane.model
  end

  describe "#fly" do
    it "needs a crew" do
      @pilots = Minitest::Mock.new
      @plane.pilots = @pilots
      assert_raises (RuntimeError) { @plane.fly }
    end

    it "needs pilots" do
      @crew = Minitest::Mock.new
      @plane.crew = @crew
      assert_raises (RuntimeError) { @plane.fly }
    end
  end
end
