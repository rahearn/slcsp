require 'csv'
require_relative 'zip_code'
require_relative 'rate_area'

class ZipCodeFile

  attr_reader :filename
  def initialize(filename)
    @filename = filename
  end

  def zip_codes
    @zip_codes ||= begin
      CSV.foreach(filename).inject(Hash.new { |h,k| h[k] = [] }) do |memo, row|
        next memo if row[0] == 'zipcode'
        ra = RateArea.new row[1], row[4]
        zip = ZipCode.new row[0]
        memo[zip] << ra
        memo
      end
    end
  end

  def single_rate_area_zip_codes
    zip_codes.select { |_,rate_areas| rate_areas.count == 1 }.map { |zip,rates| [zip, rates.first] }.to_h
  end
  
end
