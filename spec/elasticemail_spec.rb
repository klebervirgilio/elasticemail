require 'spec_helper'

describe Elasticemail do
  describe 'configuration' do
    it 'set settings' do
      expect(Elasticemail.settings[:api_key]).to be_eql ENV['ELASTIC_EMAIL_API_KEY']
    end
  end
end
