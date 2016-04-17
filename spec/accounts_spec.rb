require 'spec_helper'

describe Elasticemail::Accounts do

  describe 'delete' do
    context "when fails", vcr: {record: :new_episodes, cassette_name: "accounts/delete_fail"} do
      subject do
        described_class.delete do |delete|
          delete.notify = false
        end
      end
      it 'fails to delete account' do
        is_expected.to be_fail
      end
      it 'has error message' do
        expect(subject.error).not_to be_empty
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
        described_class.delete do |delete_account|
          delete_account.notify            = false
          delete_account.sub_account_email = email
        end
      end
      it 'fails to delete account' do
        is_expected.to be_success
      end
    end
  end

  describe 'add' do
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
