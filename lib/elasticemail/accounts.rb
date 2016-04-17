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

    def self.list
      account = Elasticemail::Account::GetSubAccountList.new
      yield account
      account.perform
    end
  end
end
