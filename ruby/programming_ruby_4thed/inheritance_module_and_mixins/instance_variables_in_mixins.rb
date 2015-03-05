module Observable
  def observers
    @observers_list ||= []
  end

  def add_observer(obj)
    observers << obj
  end

  def notify_observers
    observers.each { |o| o.update }
  end
end

class TelescopeScheduler
  include Observable

  def initialize
    @observers_list = []
  end

  def add_viewer(viewer)
    @observers_list << viewer
  end
end
