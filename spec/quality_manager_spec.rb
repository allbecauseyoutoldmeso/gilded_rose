require 'quality_manager'

describe Quality_Manager do

  subject(:quality_manager) { described_class.new([Item.new('Malbec', 5, 10), Item.new('Aged Brie', 5, 10), Item.new('Sulfuras, Hand of Ragnaros', 0, 80), Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 10), Item.new('Conjured rabbit', 5, 10)])}

  describe '#reduce_quality' do
    it 'reduces the quality by 1' do
      malbec = Item.new('Malbec', 5, 10)
      quality_manager.reduce_quality(malbec)
      expect(malbec.quality).to eq 9
    end
    it 'never reduces the quality below 0' do
      malbec = Item.new('Malbec', 5, 0)
      quality_manager.reduce_quality(malbec)
      expect(malbec.quality).to eq 0
    end
  end

  describe '#increase_quality' do
    it 'increases the quality by 1' do
      brie = Item.new('Aged Brie', 5, 10)
      quality_manager.increase_quality(brie)
      expect(brie.quality).to eq 11
    end
    it 'never increases the quality to more than 50' do
      brie = Item.new('Aged Brie', 5, 50)
      quality_manager.increase_quality(brie)
      expect(brie.quality).to eq 50
    end
  end

  describe '#update_normal_quality' do
    it 'reduces the quality by 1 if sell_by > 0' do
      malbec = Item.new('Malbec', 5, 10)
      quality_manager.update_normal_quality(malbec)
      expect(malbec.quality).to eq 9
    end
    it 'reduces the quality by 2 if sell_by <= 0' do
      malbec = Item.new('Malbec', 0, 10)
      quality_manager.update_normal_quality(malbec)
      expect(malbec.quality).to eq 8
    end
  end

  describe '#update_aged_brie' do
    it 'increases the quality by 1 if sell_by > 0' do
      brie = Item.new('Aged Brie', 5, 10)
      quality_manager.update_aged_brie_quality(brie)
      expect(brie.quality).to eq 11
    end
    it 'decreases the quality by 2 if sell_by <= 0' do
      brie = Item.new('Aged Brie', 0, 10)
      quality_manager.update_aged_brie_quality(brie)
      expect(brie.quality).to eq 12
    end
  end

  describe '#update_backstage_passes' do
    it 'increases the quality by 1 if sell_by > 10' do
      pass = Item.new('Backstage passes', 11, 5)
      quality_manager.update_backstage_pass_quality(pass)
      expect(pass.quality).to eq 6
    end
    it 'increases the quality by 2 if sell_by <=10' do
      pass = Item.new('Backstage passes', 10, 5)
      quality_manager.update_backstage_pass_quality(pass)
      expect(pass.quality).to eq 7
    end
    it 'increases the quality by 3 if sell_by <=5' do
      pass = Item.new('Backstage passes', 5, 5)
      quality_manager.update_backstage_pass_quality(pass)
      expect(pass.quality).to eq 8
    end
    it 'reduces the quality to 0 if sell_by <=0' do
      pass = Item.new('Backstage passes', 0, 5)
      quality_manager.update_backstage_pass_quality(pass)
      expect(pass.quality).to eq 0
    end
  end

  describe '#update_conjured_quality' do
    it 'reduces the quality by 2 if sell_in > 0' do
      conjured = Item.new('Conjured rabbit', 5, 5)
      quality_manager.update_conjured_quality(conjured)
      expect(conjured.quality).to eq 3
    end
    it 'reduces the quality by 4 if sell_in <= 0' do
      conjured = Item.new('Conjured rabbit', 0, 5)
      quality_manager.update_conjured_quality(conjured)
      expect(conjured.quality).to eq 1
    end
  end

  describe '#update_items' do
    before do
      quality_manager.update_items
    end
    it 'never decreases the quality of Sulfuras' do
      expect(quality_manager.items[2].quality).to eq 80
    end
  end




end
