module Elasticemail

  module Contact

    DELETE_CONTACT_ATTRIBUTES_MAPPING = {
      :api_key => "apikey",
      :rule => "rule",
      :emails => "emails"
    }.freeze


    # http://api.elasticemail.com/public/help#Contact_Delete
    class DeleteContact < Struct.new(*DELETE_CONTACT_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/contact/delete"
      end

      def mapping
        DELETE_CONTACT_ATTRIBUTES_MAPPING
      end
    end
  end
end
