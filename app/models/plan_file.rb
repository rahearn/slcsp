require 'csv'
require_relative 'plan'
require_relative 'rate_area'

class PlanFile

  attr_reader :filename
  def initialize(filename)
    @filename = filename
  end

  def plans
    @plans ||= CSV.foreach(filename).map do |row|
      next if row[0] == 'plan_id'
      ra = RateArea.new row[1], row[4]
      Plan.new row[0], row[2], (row[3].to_f * 100).to_i, ra
    end.compact
  end

  def silver_plans_by_rate_area
    plans.select(&:silver?).group_by &:rate_area
  end

end
