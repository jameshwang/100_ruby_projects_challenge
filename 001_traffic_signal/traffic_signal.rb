require 'observer'

class TrafficSignal
  include Observable

  attr_reader :light_color

  def initialize
    @light_color = 'red'
  end

  def run
    @light_color = 'green'
    changed_and_notify
    sleep 3
    @light_color = 'yellow'
    changed_and_notify
    sleep 1
    @light_color = 'red'
    changed_and_notify
  end

  private

  def changed_and_notify
    changed
    notify_observers(@light_color)
  end
end

class SignalWatcher
  def initialize(signal)
    signal.add_observer(self)
  end

  def update(light_color)
    puts "Signal is now #{light_color}"
  end
end
