require 'spec_helper'

describe Elasticemail do
  describe 'configuration' do
    it 'set settings' do
      expect(Elasticemail.settings[:api_key]).to be_eql "2ef97152-8ef5-438c-8cfa-d26c4e1e815e"
    end
  end
end
