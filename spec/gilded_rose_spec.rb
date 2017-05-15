require 'gilded_rose'

describe GildedRose do

  subject(:gilded_rose) { described_class.new([Item.new('Malbec', 5, 10), Item.new('Aged Brie', 5, 10)])}

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
      expect(gilded_rose.items[0].sell_in).to eq 4
    end

    it 'reduces quality by 2 when sell_by date has passed' do
      6.times do
        gilded_rose.update_quality
      end
      expect(gilded_rose.items[0].quality).to eq 3
    end

    it 'never reduces quality to less than zero' do
      10.times do
        gilded_rose.update_quality
      end
      expect(gilded_rose.items[0].quality).to eq 0
    end

    it 'increases the value of Aged Brie' do
      gilded_rose.update_quality
      expect(gilded_rose.items[1].quality).to eq 11
    end

    it 'never increases the value to over fifty' do
      41.times do
        gilded_rose.update_quality
      end
        expect(gilded_rose.items[1].quality).to eq 50
    end

  end

end
