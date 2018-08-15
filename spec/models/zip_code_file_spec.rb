require 'models/zip_code_file'

RSpec.describe ZipCodeFile do

  subject { described_class.new filename }
  let(:filename) { File.join(File.dirname(__FILE__), '..', 'support', 'zips.csv') }

  describe '#zip_codes' do
    it 'loads all zip codes into a hash of rate areas' do
      expect(subject.zip_codes.keys.count).to eq 2
    end
  end

  describe '#single_rate_area_zip_codes' do
    it 'returns all zip codes with a single rate area' do
      expect(subject.single_rate_area_zip_codes.keys.count).to eq 1
    end
    it 'removes the array from the hash value' do
      zip_codes = subject.single_rate_area_zip_codes
      rate_area = zip_codes[zip_codes.keys.first]
      expect(rate_area).to be_a_kind_of RateArea
    end
  end
end
