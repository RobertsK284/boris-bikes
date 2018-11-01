require_relative 'bike'

class DockingStation
  attr_reader :capacity
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'No working bikes.' unless any_working_bikes?
    @bikes.each_with_index do |bike, index|
        return @bikes.slice!(index) if !bike.broken?
    end
  end

  def dock(bike)
    fail 'Docking station full' if full?
    bikes << bike
  end

  def any_working_bikes?
    @bikes.each do |bike|
       return true if !bike.broken?
    end
    return false
  end

  private

  def full?
    bikes.count >= @capacity
  end

  def empty?
    bikes.empty?
  end
end
