# frozen_string_literal: true

require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.default_cassette_options = {
    decode_compressed_response: true
  }
  c.cassette_library_dir = File.join(
    File.dirname(__FILE__), '..', 'fixtures', 'vcr_cassettes'
  )
  c.filter_sensitive_data('<AUTH>') do |interaction|
    interaction.request.headers['Authorization'][0].sub('Basic ', '')
  end
end
