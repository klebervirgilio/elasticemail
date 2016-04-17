module Elasticemail
  class Accounts
    def self.add
      add_contact = Elasticemail::Account::AddAccount.new
      yield add_contact
      add_contact.perform
    end

    def self.delete
      add_contact = Elasticemail::Account::DeleteAccount.new
      yield add_contact
      add_contact.perform
    end
  end
end
