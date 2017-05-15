require 'gilded_rose'

describe GildedRose do

  subject(:gilded_rose) { described_class.new([Item.new('Malbec', 10, 10)])}

  describe "#update_quality" do

    it "does not change the name" do
      gilded_rose.update_quality
      expect(gilded_rose.items[0].name).to eq "Malbec"
    end

  end

end
