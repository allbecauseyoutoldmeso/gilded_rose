require_relative 'item'
require_relative 'quality_manager'
require_relative 'sell_in_manager'

class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality()
    quality_manager = Quality_Manager.new(items)
    quality_manager.update_items
  end

  def update_sell_in()
    sell_in_manager = Sell_In_Manager.new(items)
    sell_in_manager.update_items
  end

  def update_items()
    update_quality()
    update_sell_in()
  end

end
