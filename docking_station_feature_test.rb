require './lib/docking_station'
station = DockingStation.new
bike = Bike.new
bike.report_broken
bike.broken?
station.dock bike
