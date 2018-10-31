require 'docking_station'

describe DockingStation do
  describe '#dock bike' do
    it 'raises an error when full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error('Docking station full')
    end
    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end
  end

  describe '#release_bike' do
    it 'releases working bikes' do
      subject.dock(Bike.new)
      bike = subject.release_bike
      expect(bike).to be_working
    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error('No bikes available')
    end
  end
end
