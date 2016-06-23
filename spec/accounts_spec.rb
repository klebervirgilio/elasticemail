require 'spec_helper'

describe Elasticemail::Accounts do

  describe '.delete' do
    context "when fails", vcr: {record: :new_episodes, cassette_name: "accounts/delete_fail"} do

      it 'fails to delete account' do
        resp = described_class.delete do |delete|
          delete.notify = false
        end
        expect(resp).to be_fail
      end
    end
    context "when succeed", vcr: {record: :new_episodes, cassette_name: "accounts/delete_success"} do
      subject do
        email  = "example#{SecureRandom.hex}@example.com"

        resp = described_class.add do |account|
          account.email            = email
          account.password         = 'p4550rD!'
          account.confirm_password = 'p4550rD!'

          account.marketing_type!
        end

        resp = described_class.find(resp.data)

        described_class.delete do |delete_account|
          delete_account.notify            = false
          delete_account.public_account_id = resp.data['publicaccountid']
        end
      end

      it 'deletes account' do
        is_expected.to be_success
      end
    end
  end

  describe '.update_http_notification_url' do
    subject do
      email  = "example#{SecureRandom.hex}@example.com"

      resp = described_class.add do |account|
        account.email            = email
        account.password         = 'p4550rD!'
        account.confirm_password = 'p4550rD!'

        account.marketing_type!
      end

      resp = described_class.find(resp.data)

      described_class.update_http_notification_url do |account|
        account.api_key = resp.data["api_key"]
        account.clicked = true
        account.opened  = true
        account.sent    = true
        account.url   = "http://example.com"
      end
    end

    it { is_expected.to be_success }
  end

  describe '.add' do
    context "when fails", vcr: {record: :new_episodes, cassette_name: "accounts/add_fail"} do
      subject { described_class.add do end }

      it 'is failed' do
        is_expected.to be_fail
      end

      it 'has error message' do
        expect(subject.error).not_to be_empty
      end
    end

    context "when succeed", vcr: {record: :new_episodes, cassette_name: "accounts/add_success"} do
      subject do
        described_class.add do |account|
          account.email            = "example#{SecureRandom.hex}@example.com"
          account.password         = 'p4550rD!'
          account.confirm_password = 'p4550rD!'

          account.marketing_type!
        end
      end
      it 'adds a account' do
        is_expected.to be_success
      end
      it 'has data' do
        expect(subject.data).not_to be_empty
      end
    end
  end
end
