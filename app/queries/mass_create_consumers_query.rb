class MassCreateConsumersQuery

	def self.call(h)

		@cons_list = []

		h.each do |item|
			unless Consumer.find_by(onec_id: item[:onec_id])
				@consumer = Consumer.new(item)
    		unless @consumer.save
      		flash[:alert] = 'Помилка створення споживача'
      		break
      	else
      		@cons_list << @consumer.name
    		end
			end
		end
		return @cons_list
	end
end
