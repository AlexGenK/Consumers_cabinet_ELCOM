class ModifyHashService

  def self.to_consumers(a)
    consumers_array = self.to_i(a, :onec_id)
    consumers_array = self.to_date(consumers_array, :dog_en_date)
  end

  def self.to_consumptions(a)
    consumptions_array = self.to_i(a, :onec_id)
    consumptions_array = self.to_date(a, :period)
    consumptions_array = self.to_f(a, :opening_balance)
    consumptions_array = self.to_f(a, :money)
    consumptions_array = self.to_power_kwt(a, :power)
    consumptions_array = self.to_f(a, :cost)
    consumptions_array = self.to_f(a, :closing_balance)
  end

  def self.to_power_kwt(a, key)
    a.each do |item|
      item[key] = ((item[key].to_f) * 1000).to_i
    end
  end

  def self.to_i(a, key)
    a.each do |item|
      item[key] = item[key].to_i
    end
  end

  def self.to_f(a, key)
    a.each do |item|
      item[key] = item[key].to_f
    end
  end

  def self.to_date(a, key)
    a.each do |item|
      item[key] = Date.strptime(item[key], '%d.%m.%y')
    end
  end

end
