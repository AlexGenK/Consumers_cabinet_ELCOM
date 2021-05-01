class MassCreateConsumptionsQuery

  def self.call(h)

    @counter = 0

    h.each do |item|
      @consumer = Consumer.find_by(onec_id: item[:onec_id])
      if @consumer
        @prev_consumption = @consumer.consumptions.find_by(period: item[:period])
        @prev_consumption.destroy if @prev_consumption
        item.delete(:onec_id)
        @consumption = @consumer.consumptions.new(item)
        @consumption.save
        @counter += 1
      end
    end
    return @counter
  end
end