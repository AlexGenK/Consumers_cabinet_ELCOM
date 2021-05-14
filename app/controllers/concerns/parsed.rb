module Parsed
  extend ActiveSupport::Concern

  def parse_id(filename)
    filename =~ /(D|C)(\d+)_\d{1,2}-\d{1,2}-\d{1,2}_\d+/
    $2
  end

  def parse_date(filename)
    filename =~ /(D|C)\d+_(\d{1,2}-\d{1,2}-\d{1,2})_\d+/
    Date.strptime($2,'%y-%m-%d')
  end

  def parse_number(filename)
    filename =~ /(D|C)\d+_\d{1,2}-\d{1,2}-\d{1,2}_(\d+)/
    $2
  end
end