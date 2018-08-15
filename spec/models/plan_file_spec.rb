require 'models/plan_file'

RSpec.describe PlanFile do

  subject { described_class.new filename }
  let(:filename) { File.join(File.dirname(__FILE__), '..', 'support', 'plans.csv') }

  describe '#plans' do
    it 'loads all plans into an array' do
      expect(subject.plans.count).to eq 50
    end

    it 'translates the rate to cents' do
      plan = subject.plans.first
      expect(plan.rate_cents).to eq 29862
    end
  end

  describe '#silver_plans_by_rate_area' do
    let(:ra) { RateArea.new "SC", "2" }
    it 'returns a list of silver plans in each rate area' do
      actual = subject.silver_plans_by_rate_area[ra]
      expect(actual&.count).to eq 2
    end
  end

end
