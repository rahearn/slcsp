require 'values'

class RateArea < Value.new(:state, :id)

  def to_s
    "RateArea #{state} #{id}"
  end

end
