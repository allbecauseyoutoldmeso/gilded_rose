class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items

  end

  def is_normal?(item)
    ! ['Aged Brie', 'Backstage passes', 'Sulfuras'].include?(item.name)
  end

  def is_aged_brie?(item)
    item.name == 'Aged Brie'
  end

  def is_backstage_passes?(item)
    item.name == 'Backstage passes'
  end

  def is_sulfuras?(item)
    item.name == 'Sulfuras'
  end

  def reduce_quality(item)
    if item.quality > 0
      item.sell_in <= 0 ? item.quality -= 2 : item.quality -= 1
    end
  end

  def increase_quality(item)
    if item.quality < 50
      item.quality += 1
    end
  end

  def increase_quality_exponentially(item)
    if item.sell_in <= 0
      item.quality = 0
    elsif item.sell_in <=5
      item.quality +=3
    elsif item.sell_in <= 10
      item.quality +=2
    else
      item.quality += 1
    end
  end

  def update_value(item)
    if is_normal?(item)
      reduce_quality(item)
    elsif is_aged_brie?(item)
      increase_quality(item)
    elsif is_backstage_passes?(item)
      increase_quality_exponentially(item)
    end
  end

  def update_sell_in(item)
    if ! is_sulfuras?(item)
      item.sell_in = item.sell_in - 1
    end
  end

  def update_quality()
    @items.each do |item|
      update_value(item)
      update_sell_in(item)
    end
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
