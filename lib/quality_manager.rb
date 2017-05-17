require_relative 'item_category_helper'

class Quality_Manager

  include Item_Category_Helper

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def reduce_quality(item)
    item.quality -= 1 if item.quality > 0
  end

  def increase_quality(item)
    item.quality += 1 if item.quality < 50
  end

  def update_normal_quality(item)
    item.sell_in > 0 ? reduce_quality(item) : 2.times { reduce_quality(item) }
  end

  def update_aged_brie_quality(item)
    item.sell_in > 0 ? increase_quality(item) : 2.times { increase_quality(item) }
  end

  def update_backstage_pass_quality(item)
    if expires?(item, 0)
      item.quality = 0
    elsif expires?(item, 5)
      3.times { increase_quality(item) }
    elsif expires?(item, 10)
      2.times { increase_quality(item) }
    else
      increase_quality(item)
    end
  end

  def update_conjured_quality(item)
    item.sell_in > 0 ? 2.times { reduce_quality(item) } : 4.times { reduce_quality(item) }
  end

  def update_items
    items.each do |item|
      update_normal_quality(item) if is_normal?(item)
      update_aged_brie_quality(item) if is_aged_brie?(item)
      update_backstage_pass_quality(item) if is_backstage_pass?(item)
      update_conjured_quality(item) if is_conjured?(item)
    end
  end

  def expires?(item, days)
    item.sell_in <= days
  end

end
