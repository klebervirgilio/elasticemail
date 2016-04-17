$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'elasticemail'
require 'vcr'
require 'fileutils'

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

Elasticemail.configure do |config|
  config.api_key = "2ef97152-8ef5-438c-8cfa-d26c4e1e815e"
end

RSpec.configure do |c|
  # c.before(:all) do
  #   FileUtils.rm_f(File.expand_path('../../spec/vcr_cassettes', __FILE__))
  # end
end
