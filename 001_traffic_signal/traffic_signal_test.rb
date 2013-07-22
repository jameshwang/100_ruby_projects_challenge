require 'minitest/autorun'
require 'mocha/setup'
require_relative 'traffic_signal'

describe TrafficSignal do
  before do
    @traffic_signal = TrafficSignal.new
  end
  it "isn't nil" do
    refute_nil @traffic_signal
  end

  it "flashes lights red-yellow-green" do
    light_colors = %w(red yellow green)
    watcher = SignalWatcher.new(@traffic_signal)
    light_colors.each do |light_color|
      watcher.expects(:update).with(@traffic_signal)
    end
    @traffic_signal.run
  end
end
