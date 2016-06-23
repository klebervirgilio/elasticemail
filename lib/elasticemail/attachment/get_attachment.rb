module Elasticemail

  module Attachment

    GET_ATTACHMENT_ATTRIBUTES_MAPPING = {
      :api_key       => "apikey",
      :file_name     => "fileName",
      :attachment_id => "attachmentID",
    }.freeze

    # http://api.elasticemail.com/public/help#Attachment_Get
    class GetAttachment < Struct.new(*GET_ATTACHMENT_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/attachment/get"
      end

      def mapping
        GET_ATTACHMENT_ATTRIBUTES_MAPPING
      end
    end
  end
end
