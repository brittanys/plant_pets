class Plant < ApplicationRecord
  before_save :set_watered_at, :set_fed_at, :set_growth

  def needs_water?
    self.watered_at <= 5.minutes.ago
  end

  def needs_food?
    self.fed_at <= 10.minutes.ago
  end

  def set_watered_at
    self.watered_at = Time.now if self.water_amount
  end

  def set_fed_at
    self.fed_at = Time.now if self.fed_amount
  end

  def set_growth
    self.growth = water_amount.to_i + fed_amount.to_i
  end

  def age
    if growth == 0
      'baby'
    elsif growth > 0 && growth < 20
      'young adult'
    elsif growth >= 20
      'full grown'
    end
  end
end
