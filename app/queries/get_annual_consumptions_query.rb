class GetAnnualConsumptionsQuery
	def self.call(scope, year)
		scope.where('EXTRACT(YEAR FROM PERIOD) = ?', year).order(:period)
  end
end