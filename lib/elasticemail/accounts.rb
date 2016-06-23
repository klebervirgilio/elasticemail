module Elasticemail
  class Accounts
    def self.add
      account = Account::AddAccount.new
      yield account
      account.perform
    end

    def self.delete
      account = Account::DeleteAccount.new
      yield account
      account.perform
    end

    def self.find(api_key=nil)
      account = Account::LoadAccount.new(api_key)
      yield account if block_given?
      account.perform
    end

    def self.update_http_notification_url(api_key=nil)
      account = Account::UpdateHttpNotificationAccount.new(api_key)
      yield account
      account.perform
    end
  end
end
