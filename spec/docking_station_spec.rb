require 'docking_station'

describe DockingStation do
  subject { DockingStation.new }
  let(:bike) {Bike.new}

  describe 'initialization' do
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error 'Docking station full'
    end
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(bike) }
      expect { docking_station.dock(bike) }.to raise_error('Docking station full')
    end
  end

  describe '#dock bike' do
    it 'returns docked bikes' do
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end
  end

  describe '#release_bike' do
    it 'releases working bikes' do
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike).not_to be_broken
    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error('No bikes available')
    end
  end
end
