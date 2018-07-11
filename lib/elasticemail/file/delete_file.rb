module Elasticemail
  module ElasticFile
    REMOVE_FILE_ATTRIBUTES_MAPPING = {
      :api_key   => "apikey",
      :file_name => "filename",
      :file_id   => "userFileID",
    }.freeze

    # http://api.elasticemail.com/public/help#File_Delete
    class DeleteFile < Struct.new(*REMOVE_FILE_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/file/delete"
      end

      def mapping
        REMOVE_FILE_ATTRIBUTES_MAPPING
      end
    end
  end
end
