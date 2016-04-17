module Elasticemail
  class Contacts
    def self.add
      contact = Elasticemail::Contact::AddContact.new
      yield contact
      contact.perform
    end

    def self.delete
      contact = Elasticemail::Contact::DeleteContact.new
      yield contact
      contact.perform!
    end

    def self.find
      contact = Elasticemail::Contact::LoadContact.new
      yield contact
      contact.perform
    end
  end
end
