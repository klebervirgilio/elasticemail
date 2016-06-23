module Elasticemail
  class Attachments
    def self.upload
      attachment = Attachment::Upload.new
      yield attachment
      attachment.perform
    end

    def self.remove(file_name, api_key=nil)
      attachment = Attachment::RemoveAttachment.new(api_key, file_name)
      yield attachment if block_given?
      attachment.perform
    end

    def self.get(file_name, attachment_id, api_key=nil)
      attachment = Attachment::GetAttachment.new(api_key, file_name, attachment_id)
      yield attachment if block_given?
      attachment.perform
    end
  end
end
