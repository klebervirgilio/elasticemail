require 'spec_helper'

describe Elasticemail::Contact::AddContact do
  describe 'params' do
    subject do
      add_contact = Elasticemail::Contact::AddContact.new
      add_contact.public_account_id = 1
      add_contact.build_params
    end

    let(:param_name) {
      Elasticemail::Contact::ADD_CONTACT_ATTRIBUTES_MAPPING[:public_account_id]
    }

    describe 'assign' do
      it "resolves api param name" do
        is_expected.to have_key(param_name)
      end

      it 'assign value' do
        expect(subject[param_name]).to be_eql 1
      end
    end
  end
end
