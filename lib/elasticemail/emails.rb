module Elasticemail
  class Emails
    def self.deliver
      email = Elasticemail::Email::SendEamil.new
      yield email
      email.perform
    end
  end
end
