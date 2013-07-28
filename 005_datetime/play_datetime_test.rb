require 'minitest/autorun'
require 'date'
require_relative 'play_datetime'

describe PlayDateTime do
  before do
    @play_date_time = PlayDateTime.new
  end
  it "should not be nill" do
    refute_nil @play_date_time
  end

  [
    :today,
    :tomorrow,
    :yesterday
  ].each do |method|
    it "should respond to" do
      assert_respond_to @play_date_time, method
    end
  end

  it "should reply back with today's date" do
    assert_equal Date.today, @play_date_time.today
  end

  it "should reply back with tomorrow's date" do
    assert_equal Date.today + 1, @play_date_time.tomorrow
  end

  it "should reply back with yesterday's date" do
    assert_equal Date.today - 1, @play_date_time.yesterday
  end
end
