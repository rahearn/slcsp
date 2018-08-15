require 'thor'
require_relative '../app/models/processor'

class Cli < Thor

  desc "calculate", "Calculate the second lowest cost silver plan from the given source data"
  option :zips, default: 'data/zips.csv', desc: 'Path to source zips.csv file'
  option :plans, default: 'data/plans.csv', desc: 'Path to source plans.csv file'
  option :slcsp, default: 'data/slcsp.csv', desc: 'Path to source slcsp.csv file'
  option :output, default: './output.csv', desc: 'Path to output file. Must not exist yet'
  def calculate
    if File.exists? options[:output]
      warn "Output file #{options[:output]} cannot exist before running slcsp"
      exit 1
    end
    begin
      output_file = File.open options[:output], 'w'
      processor = Processor.new plans: options[:plans], zips: options[:zips], slcsp: options[:slcsp], output: output_file
      processor.call
    ensure
      output_file.close
    end
  end
  default_task :calculate

end
