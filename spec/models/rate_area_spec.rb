require 'models/rate_area'

RSpec.describe RateArea do

  subject { described_class.new state, id }
  let(:state) { "NY" }
  let(:id) { "1" }

  it "treats equivalent values as equal" do
    other = described_class.new state, id
    expect(subject).to eq other
    expect(subject.object_id).to_not eq other.object_id
  end

end
