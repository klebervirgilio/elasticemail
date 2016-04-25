require 'spec_helper'

describe Elasticemail::Contacts do

  describe 'quick_add' do
    context "fails" do
      it 'does not add a new contact', vcr: {cassette_name: "contacts/quick_add_fail"}  do
        resp = described_class.quick_add do end
        expect(resp).to be_fail
      end
    end

    context "succeed", vcr: {record: :new_episodes, cassette_name: "contacts/quick_add_success"} do

      let(:email) { "example#{SecureRandom.hex}@example.com" }

      subject do
        resp = Elasticemail::Accounts.add do |account|
          account.email            = "example#{SecureRandom.hex}@example.com"
          account.password         = 'p4550rD!'
          account.confirm_password = 'p4550rD!'

          account.marketing_type!
        end

        resp = Elasticemail::Accounts.find(resp.data)

        described_class.quick_add do |contact|
          contact.emails  = email
          contact.api_key = resp.data['api_key']
        end

      end

      it 'adds a new contact' do
        is_expected.to be_success
      end
    end
  end

  describe 'add' do
    context "fails" do
      it 'does not add a new contact', vcr: {cassette_name: "contacts/add_fail"}  do
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

        resp = Elasticemail::Accounts.find(resp.data)

        described_class.add do |contact|
          contact.email               = email
          contact.requires_activation = false
          contact.public_account_id   = resp.data['publicaccountid']
        end

      end

      it 'adds a contact' do
        expect(subject.data).to match /Thank you, an activation email has been sent to #{email}.  Please check your email to complete the sign-up process./
      end
    end
  end

  describe 'delete' do
    context "when fails to delete" do
      it 'does not delete a contact', vcr: {record: :new_episodes, cassette_name: "contacts/delete_fail"}  do
        resp = described_class.delete { |contact| contact.emails = 'email' }
        expect(resp).to be_fail
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

        resp = Elasticemail::Accounts.find(resp.data)

        described_class.add do |contact|
          contact.email               = email
          contact.requires_activation = false
          contact.public_account_id   = resp.data['publicaccountid']
        end

        described_class.delete do |contact|
          contact.api_key = resp.data
          contact.emails  = email
        end
      end

      it 'deletes a contact' do
        is_expected.to be_success
      end
    end
  end

  describe 'load' do
    context "when fails to load" do
      it 'does not load a contact', vcr: {cassette_name: "contacts/load_fail"}  do
        resp = described_class.find do end
        expect(resp).to be_fail
      end
    end

    context "succeed to load", vcr: {record: :new_episodes, cassette_name: "contacts/load_success"} do
      let(:email) { "USER@example.com" }
      subject do
        resp = Elasticemail::Accounts.add do |account|
          account.email            = "NOW@example.com"
          account.password         = 'p4550rD!'
          account.confirm_password = 'p4550rD!'

          account.marketing_type!
        end

        api_key = resp.data

        resp = Elasticemail::Accounts.find(api_key)

        described_class.add do |contact|
          contact.email               = email
          contact.requires_activation = false
          contact.public_account_id   = resp.data['publicaccountid']
        end

        described_class.find do |contact|
          contact.api_key = api_key
          contact.email   = email
        end
      end

      it 'loads a contact' do
        is_expected.to be_success
      end
    end
  end
end
