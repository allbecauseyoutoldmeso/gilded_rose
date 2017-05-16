require 'item'

describe Item do

  subject(:malbec) { described_class.new('Malbec', 10, 5) }

  it 'has a name' do
    expect(malbec.name).to eq 'Malbec'
  end

  it 'has a sell_in value' do
    expect(malbec.sell_in).to eq 10
  end

  it 'sell_in value can be changed' do
    malbec.sell_in += 1
    expect(malbec.sell_in).to eq 11
  end

  it 'has a quality value' do
    expect(malbec.quality).to eq 5
  end

  it 'quality value can be changed' do
    malbec.quality += 1
    expect(malbec.quality).to eq 6
  end

  it 'has a #to_s method which returns a descriptive string' do
    expect(malbec.to_s).to eq 'Malbec, 10, 5'
  end

end
