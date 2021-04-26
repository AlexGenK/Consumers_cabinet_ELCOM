class ReadCsvFileService
  require 'csv'

  def self.call(file, structure)
    @a = []
    @csv_text = file.read.encode('UTF-8', 'Windows-1251', invalid: :replace, indef: :replace).gsub(/"/,'\'')
    @csv = CSV.parse(@csv_text, col_sep: ';')
    @csv.each do |item|
      @a << Hash[structure.each_with_index.map {|x, i| [x, item[i]]}]
    end
    return @a
  end
end