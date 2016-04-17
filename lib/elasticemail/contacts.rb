module Elasticemail
  class Contacts
    def self.add(params)
      Elasticemail::Contact::AddContact.new(params).perform
    end
  end
end
