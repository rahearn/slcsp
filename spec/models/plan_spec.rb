require 'models/plan'
require 'models/rate_area'

RSpec.describe Plan do

  subject { described_class.new id, metal_level, rate, rate_area }
  let(:id) { "12345" }
  let(:metal_level) { "SILVER" }
  let(:rate) { 124.21 }
  let(:rate_area) { RateArea.new "NY", "1" }

  it "should verify it is silver level" do
    expect(subject).to be_silver
  end

  context "gold plan" do
    let(:metal_level) { "Gold" }
    it "should verify it is not silver" do
      expect(subject).to_not be_silver
    end
  end
end
