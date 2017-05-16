require_relative 'item_category_helper'

class Sell_In_Manager

  include Item_Category_Helper

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_items
    items.each do |item|
      if ! is_sulfuras?(item)
        item.sell_in -= 1
      end
    end
  end

end
