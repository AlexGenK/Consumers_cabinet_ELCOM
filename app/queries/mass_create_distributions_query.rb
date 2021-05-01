class MassCreateDistributionsQuery

  def self.call(h)

    @counter = 0

    h.each do |item|
      @consumer = Consumer.find_by(onec_id: item[:onec_id])
      if @consumer
        @prev_distribution = @consumer.distributions.find_by(period: item[:period])
        @prev_distribution.destroy if @prev_distribution
        item.delete(:onec_id)
        item.delete(:power)
        @distribution = @consumer.distributions.new(item)
        @distribution.save
        @counter += 1
      end
    end
    return @counter
  end
end