module Elasticemail
  module Attachment
    UPLOAD_ATTRIBUTES_MAPPING = {
      :api_key            => "apikey",
      :expires_after_days => "expiresAfterDays",
      :file_name          => "name",
    }.freeze

    # http://api.elasticemail.com/public/help#File_Upload
    class Upload < Struct.new(*UPLOAD_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      attr_accessor :file_path, :file_content_type

      def perform
        super do
          session.post do |request|
            request.path   = [version, path].join('/')
            request.params = {
                                "apikey"           => api_key || _api_key,
                                "expiresAfterDays" => expires_after_days || 30,
                                "name"             => file_name,
                             }
            request.body   = { "file" => file }
          end
        end
      end

      def file
        Faraday::UploadIO.new(file_path, file_content_type)
      end

      def path
        :"/file/upload"
      end

      def mapping
        UPLOAD_ATTRIBUTES_MAPPING
      end
    end
  end
end
