require 'guide/config'

RSpec.describe Guide::Config do
  describe ".actions" do
    it { expect(Guide::Config.actions).to eql(['list', 'find', 'add', 'quit']) }
    it { expect(Guide::Config.actions).not_to eql(['list', 'find', 'add', 'quit', 'edit']) }
  end
end
