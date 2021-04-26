class ModifyHashService

	def self.to_consumers(a)
		consumers_array = self.to_i(a, :onec_id)
		consumers_array = self.to_date(consumers_array, :dog_en_date)
	end

	def self.to_i(a, key)
		a.each do |item|
			item[key] = item[key].to_i
		end
	end

	def self.to_date(a, key)
		a.each do |item|
			item[key] = Date.strptime(item[key], '%d.%m.%y')
		end
	end

end
