require 'guide/config'

RSpec.describe Guide::Config do
  describe '.actions' do
    before { @array = %w(list find add quit) }
    it { expect(Guide::Config.actions).to eql(@array) }
    it { expect(Guide::Config.actions).not_to eql(@array.push('edit')) }
  end
end
