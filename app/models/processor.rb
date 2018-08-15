require 'csv'
require_relative 'plan_file'
require_relative 'zip_code_file'

class Processor

  attr_reader :plans, :zips, :slcsp, :output
  def initialize(plans:, zips:, slcsp:, output:)
    @plans = plans
    @zips = zips
    @slcsp = slcsp
    @output = output
  end

  def call
    silver_plans = PlanFile.new(plans).silver_plans_by_rate_area
    zipcodes = ZipCodeFile.new(zips).single_rate_area_zip_codes
    output_csv = CSV.generate do |writer|
      CSV.foreach(slcsp) do |reader|
        ra = zipcodes[ZipCode.new(reader[0])]
        if ra.nil?
          writer << reader
          next
        end
        plans = silver_plans[ra]
        if plans.nil?
          writer << reader
          next
        end
        writer << [reader[0], get_second_lowest_cost(plans)]
      end
    end
    output.write output_csv
  end

  def get_second_lowest_cost(plans)
    sorted = plans.sort_by &:rate_cents
    lowest = sorted[0].rate_cents
    sorted.each do |plan|
      return plan.rate if plan.rate_cents != lowest
    end
    return nil
  end

end
