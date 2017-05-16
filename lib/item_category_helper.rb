module Item_Category_Helper

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

end
