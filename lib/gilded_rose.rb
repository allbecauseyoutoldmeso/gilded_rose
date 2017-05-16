require_relative 'item'
require_relative 'value_manager'

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

  def reduce_quality(item)
    if item.quality > 0
      item.quality -= 1
    end
  end

  def increase_quality(item)
    if item.quality < 50
      item.quality += 1
    end
  end

  def update_normal_quality(item)
    item.sell_in > 0 ? reduce_quality(item) : 2.times { reduce_quality(item) }
  end

  def update_aged_brie_quality(item)
    increase_quality(item)
  end

  def update_backstage_pass_quality(item)
    if item.sell_in <= 0
      item.quality = 0
    elsif item.sell_in <=5
      3.times { increase_quality(item) }
    elsif item.sell_in <= 10
      2.times { increase_quality(item) }
    elsif
      increase_quality(item)
    end
  end

  def update_conjured_quality(item)
    item.sell_in > 0 ? 2.times { reduce_quality(item) } : 4.times { reduce_quality(item) }
  end

  def update_quality()
    items.each do |item|
      if is_normal?(item)
        update_normal_quality(item)
      elsif is_aged_brie?(item)
        update_aged_brie_quality(item)
      elsif is_backstage_pass?(item)
        update_backstage_pass_quality(item)
      elsif is_conjured?(item)
        update_conjured_quality(item)
      end
    end
  end

  def update_sell_in()
    items.each do |item|
      if ! is_sulfuras?(item)
        item.sell_in -= 1
      end
    end
  end

  def update_items()
    update_quality()
    update_sell_in()
  end

end
