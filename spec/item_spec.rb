require 'item'

describe Item do

  subject(:malbec) { described_class.new('Malbec', 10, 5) }

  it 'has a name' do
    expect(malbec.name).to eq 'Malbec'
  end

  it 'has a sell_in value' do
    expect(malbec.sell_in).to eq 10
  end

  it 'has a quality value' do
    expect(malbec.quality).to eq 5
  end

  it 'has a #to_s method which returns a descriptive string' do
    expect(malbec.to_s).to eq 'Malbec, 10, 5'
  end

end