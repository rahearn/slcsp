require 'values'

class Plan < Value.new(:id, :metal_level, :rate_cents, :rate_area)

  def silver?
    metal_level.downcase == "silver"
  end

  def rate
    (rate_cents / 100.0).to_s
  end

end
