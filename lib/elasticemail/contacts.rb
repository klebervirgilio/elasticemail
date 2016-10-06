module Elasticemail
  class Contacts
    def self.add
      contact = Elasticemail::Contact::AddContact.new
      yield contact
      contact.perform
    end

    def self.quick_add
      contact = Elasticemail::Contact::QuickAddContact.new
      yield contact
      contact.perform
    end

    def self.delete
      contact = Elasticemail::Contact::DeleteContact.new
      yield contact
      contact.perform
    end

    def self.find
      contact = Elasticemail::Contact::LoadContact.new
      yield contact
      contact.perform
    end

    def self.find_by(api_key, email)
      Elasticemail::Contact::LoadContact.new(api_key, email).perform
    end

    def self.change_status
      contact = Elasticemail::Contact::ChangeStatusContact.new
      yield contact
      contact.perform
    end

    def self.activate(api_key, emails)
      Elasticemail::Contact::ChangeStatusContact.new(api_key, emails, Elasticemail::Contact::ACTIVE).perform
    end

    def self.inactivate(api_key, emails)
      Elasticemail::Contact::ChangeStatusContact.new(api_key, emails, Elasticemail::Contact::INACTIVE).perform
    end

    def self.unsubscribe(api_key, emails)
      Elasticemail::Contact::ChangeStatusContact.new(api_key, emails, Elasticemail::Contact::UNSUBSCRIBED).perform
    end
  end
end
