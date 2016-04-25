module Elasticemail
  class Attachments
    def self.upload
      attachment = Elasticemail::Attachment::Upload.new
      yield attachment
      attachment.perform
    end
  end
end
