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
      let(:email) { "example#{SecureRandom.hex}@example.com" }
      subject do
        resp = Elasticemail::Accounts.add do |account|
          account.email            = "example#{SecureRandom.hex}@example.com"
          account.password         = 'p4550rD!'
          account.confirm_password = 'p4550rD!'

          account.marketing_type!
        end

        resp = Elasticemail::Accounts.list do |account|
          account.api_key = resp.data
        end

        described_class.add do |contact|
          contact.email               = email
          contact.requires_activation = false
          contact.public_account_id   = resp.data[0]['publicaccountid']
        end

      end

      it 'adds a contact' do
        expect(subject.data).to match /Thank you, an activation email has been sent to #{email}.  Please check your email to complete the sign-up process./
      end
    end
  end
  describe 'delete' do
    context "when fails to delete" do
      it 'does not delete a contact', vcr: {cassette_name: "contacts/delete_fail"}  do
        expect {
          described_class.delete do end
        }.to raise_error { Elasticemail::Errors::PayloadNotValid }
      end
    end

    context "succeed", vcr: {record: :new_episodes, cassette_name: "contacts/delete_success"} do
      let(:email) { "example#{SecureRandom.hex}@example.com" }
      subject do
        resp = Elasticemail::Accounts.add do |account|
          account.email            = "example#{SecureRandom.hex}@example.com"
          account.password         = 'p4550rD!'
          account.confirm_password = 'p4550rD!'

          account.marketing_type!
        end

        resp = Elasticemail::Accounts.list do |account|
          account.api_key = resp.data
        end

        described_class.add do |contact|
          contact.email               = email
          contact.requires_activation = false
          contact.public_account_id   = resp.data[0]['publicaccountid']
        end

        described_class.delete do |contact|
          contact.api_key = resp.data
          contact.emails  = "email"
        end
      end

      it 'deletes a contact' do
        is_expected.to be_success
      end
    end
  end
end
