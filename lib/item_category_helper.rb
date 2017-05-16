module Item_Category_Helper

  def is_normal?(item)
    ! ['Aged Brie', 'Backstage pass', 'Sulfuras', 'Conjured'].any? { |words| item.name.include?(words) }
  end

  def is_aged_brie?(item)
    item.name.include?('Aged Brie')
  end

  def is_backstage_pass?(item)
    item.name.include?('Backstage pass')
  end

  def is_sulfuras?(item)
    item.name.include?('Sulfuras')
  end

  def is_conjured?(item)
    item.name.include?('Conjured')
  end

end
