require 'values'

class Plan < Value.new(:id, :metal_level, :rate, :rate_area)

  def silver?
    metal_level.downcase == "silver"
  end
  
end
