class GetUniqueYearsQuery
  def self.call(scope)
    years_array = scope.map {|item| item.period.year}
    years_array.uniq.sort.reverse
  end
end