module Elasticemail
  module Attachment
    UPLOAD_ATTRIBUTES_MAPPING = {
      :api_key => "apikey",
    }.freeze

    class Upload < Struct.new(*UPLOAD_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      attr_accessor :attachment_path, :attachment_content_type

      def perform
        super do
          session.post do |request|
            request.path   = [version, path].join('/')
            request.params = { "apikey" => api_key || _api_key }
            request.body   = { "attachmentFile" => attachment }
          end
        end
      end

      def attachment
        Faraday::UploadIO.new(attachment_path, attachment_content_type)
      end

      def path
        :"/attachment/upload"
      end

      def mapping
        UPLOAD_ATTRIBUTES_MAPPING
      end
    end

  end
end
