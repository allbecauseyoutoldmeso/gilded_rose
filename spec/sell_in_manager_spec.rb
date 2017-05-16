require 'sell_in_manager'

describe Sell_In_Manager do

  subject(:sell_in_manager) { described_class.new([Item.new('Malbec', 10, 10), Item.new('Sulfuras, Hand of Ragnaros', -1, 80)])}

  describe '#update items' do
    before do
      sell_in_manager.update_items
    end
    it 'decreases the sell in value of most items by 1' do
      expect(sell_in_manager.items[0].sell_in).to eq 9
    end
    it 'never decreases the value of Sulfuras' do
      expect(sell_in_manager.items[1].sell_in).to eq -1
    end
  end

end
