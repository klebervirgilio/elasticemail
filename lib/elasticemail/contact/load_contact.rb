module Elasticemail

  module Contact

    LOAD_CONTACT_ATTRIBUTES_MAPPING = {
      :api_key => "apikey",
      :email   => "email"
    }.freeze


    # http://api.elasticemail.com/public/help#Contact_LoadContact
    class LoadContact < Struct.new(*LOAD_CONTACT_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/contact/loadcontact"
      end

      def mapping
        LOAD_CONTACT_ATTRIBUTES_MAPPING
      end
    end
  end
end
