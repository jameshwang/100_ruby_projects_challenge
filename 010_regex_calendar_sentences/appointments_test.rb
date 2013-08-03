require 'minitest/autorun'
require_relative 'appointments'

describe Appointment do
  before do
    @appointment = Appointment.new
  end
  # it "should make an appointment" do

  #   @appointment.create("Next Tuesday, meet with gf")
  #   # assert_equal @appointment.date,
  # end

  it "should translate Mon to 1" do
    assert_equal 1, @appointment.day_to_date("Mon")
  end
  it "should translate Tues to 2" do
    assert_equal 2, @appointment.day_to_date("Tues")
  end
  it "should translate Wed to 3" do
    assert_equal 3, @appointment.day_to_date("Wed")
  end
  it "should translate Thurs to 4" do
    assert_equal 4, @appointment.day_to_date("Thurs")
  end
  it "should translate MON to 1" do
    assert_equal 1, @appointment.day_to_date("MON")
  end

  it "should fail to translate asdf and return 0" do
    assert_equal 0, @appointment.day_to_date("asdf")
  end
end
