require 'spec_helper'

describe Elasticemail::Domains do

  # describe 'delete' do
  #   context "when fails", vcr: {record: :new_episodes, cassette_name: "domains/delete_fail"} do

  #     it 'fails to delete domain' do
  #       resp = described_class.delete do |delete|
  #         delete.notify = false
  #       end
  #       expect(resp).to be_fail
  #     end
  #   end
  #   context "when succeed", vcr: {record: :new_episodes, cassette_name: "domains/delete_success"} do
  #     subject do
  #       email  = "example#{SecureRandom.hex}@example.com"

  #       resp = described_class.add do |domain|
  #         domain.email            = email
  #         domain.password         = 'p4550rD!'
  #         domain.confirm_password = 'p4550rD!'

  #         domain.marketing_type!
  #       end

  #       resp = described_class.find(resp.data)

  #       described_class.delete do |delete_domain|
  #         delete_domain.notify            = false
  #         delete_domain.public_domain_id = resp.data['publicdomainid']
  #       end
  #     end

  #     it 'deletes domain' do
  #       is_expected.to be_success
  #     end
  #   end
  # end

  describe 'add' do
    context "when fails", vcr: {record: :new_episodes, cassette_name: "domains/add_fail"} do
      subject { described_class.add do end }

      it 'is failed' do
        is_expected.to be_fail
      end

      it 'has error message' do
        expect(subject.error).not_to be_empty
      end
    end

    context "when succeed", vcr: {record: :new_episodes, cassette_name: "domains/add_success"} do
      subject do
        resp = Elasticemail::Accounts.add do |account|
          account.email            = "NOW@example.com"
          account.password         = 'p4550rD!'
          account.confirm_password = 'p4550rD!'

          account.marketing_type!
        end

        api_key = resp.data

        Elasticemail::Domains.add do |domain|
          domain.api_key = api_key
          domain.domain  = 'somesite.com'
        end
      end
      it 'adds a domain' do
        is_expected.to be_success
      end
    end
  end
end
