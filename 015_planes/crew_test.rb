require 'minitest/autorun'
require 'rr'
require_relative 'crew'

describe Crew do
  before do
    @crew = Crew.new
    @plane = Minitest::Mock.new
  end

  it "should have a personnel list" do
    assert_respond_to @crew, :personnel_list
  end

  describe "#board_plane" do
    it "should assign itself to the plane's crew" do
      @plane.expect(:crew=, @crew, [@crew])
      assert_equal @crew, @crew.board_plane(@plane)

      @plane.verify
    end
  end

  it "#clean_plane should assign the plane's clean to be true" do
    @plane.expect(:clean=, true, [true])
    @crew.clean_plane(@plane)
    @plane.verify
  end
end
