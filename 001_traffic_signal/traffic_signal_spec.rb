require_relative 'traffic_signal'

describe TrafficSignal do
  before(:each) do
    @traffic_signal = TrafficSignal.new
  end

  it "isn't nil" do
    @traffic_signal.should_not be_nil
  end

  it "flashes lights red-yellow-green" do
    light_colors = %w(red yellow green)
    watcher = SignalWatcher.new(@traffic_signal)
    light_colors.each do |light_color|
      watcher.should_receive(:update).with(@traffic_signal)
    end
    @traffic_signal.run
  end
end
