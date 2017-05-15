require 'gilded_rose'

describe GildedRose do

  subject(:gilded_rose) { described_class.new([Item.new('Malbec', 10, 10)])}

  describe "#update_quality" do

    it "does not change the name" do
      gilded_rose.update_quality
      expect(gilded_rose.items[0].name).to eq "Malbec"
    end

    it 'reduces the quality by one' do
      gilded_rose.update_quality
      expect(gilded_rose.items[0].quality).to eq 9
    end

    it 'reduces the sell_in time by one' do
      gilded_rose.update_quality
      expect(gilded_rose.items[0].sell_in).to eq 9
    end

  end

end
