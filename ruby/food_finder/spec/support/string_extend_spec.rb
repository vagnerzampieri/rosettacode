require 'support/string_extend'

RSpec.describe String do
  it '#titlecase' do
    expect('homer simpson'.titlecase).to eql('Homer Simpson')
  end
end
