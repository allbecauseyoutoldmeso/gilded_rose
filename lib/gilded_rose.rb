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
    item.name == 'Aged Brie'
  end

  def is_sulfuras?(item)
    item.name == 'Sulfuras'
  end

  def reduce_quality(item)
    if item.quality > 0
        item.quality = item.quality - 1
    end
  end

  def increase_quality(item)
    if item.quality < 50
      item.quality += 1
    end
  end

  def update_quality()
    @items.each do |item|
      if is_normal?(item)
        reduce_quality(item)
      else
        increase_quality(item)
        if item.name == "Backstage passes"
          if item.sell_in < 11
            increase_quality(item)
          end
          if item.sell_in < 6
            increase_quality(item)
          end
        end
      end

      if ! is_sulfuras?(item)
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes"
            if item.quality > 0
              if item.name != "Sulfuras"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
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
