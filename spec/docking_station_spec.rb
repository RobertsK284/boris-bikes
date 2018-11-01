require 'docking_station'

describe DockingStation do
  subject { DockingStation.new }
  let(:bike) { double(:bike) }

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
      subject.dock(double(:bike, broken?: false))
      expect(subject.release_bike).not_to be_broken
    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error('No bikes available')
    end
    it 'fails to release a broken bike' do
      subject.dock(double(:bike, broken?: true))
      expect { (subject.release_bike) }.to raise_error 'No working bikes.'
    end
  end

  describe '#any_working_bikes?' do
    it 'does docking station contain a working bike?' do
      subject.dock(double(:bike, broken?: false))
      expect(subject.any_working_bikes?).to eq(true)
    end
  end
end
