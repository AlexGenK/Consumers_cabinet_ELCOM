class GetAnnualConsumptionsQuery
	def self.call(scope, year)
		annual_cons = scope.where('EXTRACT(YEAR FROM period) = ?', year).order(:period)
		annual_table = annual_cons.pluck(:period, :power)
		annual_table.map{ |item| [UA_MONTHS_SINGLE[item[0].month], (item[1].to_f)/1000]}
  end
end