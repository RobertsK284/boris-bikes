require './lib/docking_station'
require './lib/bike'
docking_station = DockingStation.new
bike = Bike.new
docking_station.dock(bike)
