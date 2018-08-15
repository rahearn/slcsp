require 'thor'

class Cli < Thor

  desc "calculate", "Calculate the second lowest cost silver plan from the given source data"
  option :zips, default: 'data/zips.csv', desc: 'Path to source zips.csv file'
  option :plans, default: 'data/plans.csv', desc: 'Path to source plans.csv file'
  option :slcsp, default: 'data/slcsp.csv', desc: 'Path to source slcsp.csv file'
  option :output, default: './output.csv', desc: 'Path to output file. Must not exist yet'
  def calculate
    fail "TODO"
  end
  default_task :calculate

end
