require_relative '../lib/preambular'
require_relative 'sample_files'

RSpec.configure do |c|
  c.include SampleFiles
end