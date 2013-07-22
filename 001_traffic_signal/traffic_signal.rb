require 'observer'

class TrafficSignal
  include Observable

  attr_accessor :light_color

  def initialize
    light_color = TrafficLight.red
  end

  def run
    change_light_color(TrafficLight.green)
    sleep 3
    change_light_color(TrafficLight.yellow)
    sleep 1
    change_light_color(TrafficLight.red)
  end

  private

  def change_light_color(color)
    light_color = color
    changed_and_notify
  end

  def changed_and_notify
    changed
    notify_observers(self)
  end

  TrafficLight = Struct.new(:color) do
    def self.red; TrafficLight.new('red'); end
    def self.green; TrafficLight.new('green'); end
    def self.yellow; TrafficLight.new('yellow'); end
  end
end

class SignalWatcher
  def initialize(signal)
    signal.add_observer(self)
  end

  def update(signal)
    puts "Signal is now #{signal.light_color}"
  end
end
