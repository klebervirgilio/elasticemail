module Elasticemail
  class Accounts
    def self.add
      account = Elasticemail::Account::AddAccount.new
      yield account
      account.perform
    end

    def self.delete
      account = Elasticemail::Account::DeleteAccount.new
      yield account
      account.perform
    end

    def self.find(api_key=nil)
      account = Elasticemail::Account::LoadAccount.new(api_key)
      yield account if block_given?
      account.perform
    end
  end
end
