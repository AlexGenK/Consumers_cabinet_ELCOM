class GetAnnualCostQuery
  def self.call(scope, year)
    annual_cost = scope.where('EXTRACT(YEAR FROM period) = ?', year).order(:period)
    annual_table = annual_cost.pluck(:period, :cost)
    annual_table.map{ |item| [UA_MONTHS_SINGLE[item[0].month], item[1]]}
  end
end