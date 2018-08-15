require 'models/processor'
require 'tempfile'

RSpec.describe Processor do

  let(:support_base) { File.join File.dirname(__FILE__), '..', 'support' }
  let(:plans_file) { File.join support_base, 'plans.csv' }
  let(:zips_file) { File.join support_base, 'zips.csv' }
  let(:slcsp_file) { File.join support_base, 'slcsp.csv' }
  let(:output_file) { Tempfile.new }
  let(:expected_output) { File.read File.join(support_base, 'expected_output.csv') }
  subject { described_class.new plans: plans_file, zips: zips_file, slcsp: slcsp_file, output: output_file }

  after do
    output_file.close
    output_file.unlink
  end

  describe '#call' do
    it 'processes the files' do
      subject.call
      output_file.flush
      actual = File.read(output_file.path)
      expect(actual).to eq expected_output
    end
  end

end
