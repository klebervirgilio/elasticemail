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

    def self.add_webhook(api_key=nil)
      account = Account::AddWebhook.new(api_key)
      yield account
      account.perform
    end

    def self.update_webhook(api_key=nil)
      account = Account::UpdateWebhook.new(api_key)
      yield account
      account.perform
    end

    def self.delete_webhook(api_key=nil)
      account = Account::DeleteWebhook.new(api_key)
      yield account
      account.perform
    end

    def self.load_webhook(api_key=nil)
      account = Account::LoadWebhook.new(api_key)
      yield account
      account.perform
    end

    def self.update_http_notification_url(api_key=nil)
      account = Account::UpdateHttpNotificationAccount.new(api_key)
      yield account
      account.perform
    end

    def self.update_profile(api_key=nil)
      account = Account::UpdateProfileAccount.new(api_key)
      yield account
      account.perform
    end
  end
end
