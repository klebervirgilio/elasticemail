module Elasticemail
  module ElasticFile
    GET_FILE_ATTRIBUTES_MAPPING = {
      :api_key       => "apikey",
      :file_name     => "filename"
    }.freeze

    # http://api.elasticemail.com/public/help#File_Load
    class LoadFile < Struct.new(*GET_FILE_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/file/load"
      end

      def mapping
        GET_FILE_ATTRIBUTES_MAPPING
      end
    end
  end
end
