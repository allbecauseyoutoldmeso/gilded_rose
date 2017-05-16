require_relative 'item'
require_relative 'quality_manager'
require_relative 'sell_in_manager'

class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def is_normal?(item)
    ! ['Aged Brie', 'Backstage passes', 'Sulfuras', 'Conjured'].include?(item.name)
  end

  def is_aged_brie?(item)
    item.name == 'Aged Brie'
  end

  def is_backstage_pass?(item)
    item.name == 'Backstage passes'
  end

  def is_sulfuras?(item)
    item.name == 'Sulfuras'
  end

  def is_conjured?(item)
    item.name == 'Conjured'
  end

  def update_quality()
    quality_manager = Quality_Manager.new(items)
    quality_manager.update_items
  end

  def update_sell_in()
    sell_in_manager = Sell_In_Manager.new(items)
    sell_in_manager.update_items
    # items.each do |item|
    #   if ! is_sulfuras?(item)
    #     item.sell_in -= 1
    #   end
    # end
  end

  def update_items()
    update_quality()
    update_sell_in()
  end

end
