require 'spec_helper'

describe Elasticemail::Contacts do
  describe 'add' do
    context "fails" do
      it 'adds a contact', vcr: {cassette_name: "contacts/add_fail"}  do
        resp = described_class.add do end
        expect(resp).to be_fail
      end
    end

    context "succeed", vcr: {record: :new_episodes, cassette_name: "contacts/add_success"} do
      subject do
        email = "example#{SecureRandom.hex}@example.com"
        resp  = Elasticemail::Accounts.add do |account|
          account.email            = email
          account.password         = 'p4550rD!'
          account.confirm_password = 'p4550rD!'

          account.marketing_type!
        end

        described_class.add do |contact|
          contact.email = "example#{SecureRandom.hex}@example.com"

        end
      end

      it 'adds a contact' do


      end
    end
  end
end
