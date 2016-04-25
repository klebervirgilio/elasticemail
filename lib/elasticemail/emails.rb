module Elasticemail
  class Emails
    def self.deliver
      email = Elasticemail::Email::SendEmail.new
      yield email
      email.perform
    end
  end
end
