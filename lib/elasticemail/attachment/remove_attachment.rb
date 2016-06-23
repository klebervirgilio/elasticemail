module Elasticemail

  module Attachment

    REMOVE_ATTACHMENT_ATTRIBUTES_MAPPING = {
      :api_key => "apikey",
      :file_name => "fileName",
    }.freeze


    # http://api.elasticemail.com/public/help#Attachment_Remove
    class RemoveAttachment < Struct.new(*REMOVE_ATTACHMENT_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/attachment/remove"
      end

      def mapping
        REMOVE_ATTACHMENT_ATTRIBUTES_MAPPING
      end
    end
  end
end
