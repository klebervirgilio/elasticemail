module Elasticemail
  class Contacts
    def self.add
      contact = Elasticemail::Contact::AddContact.new
      yield contact
      contact.perform
    end
  end
end
