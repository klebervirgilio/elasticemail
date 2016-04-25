module Elasticemail
  module Contact

    QUICK_ADD_CONTACT_ATTRIBUTES_MAPPING = {
      :api_key      => "apikey",
      :emails       => "emails",
      :first_name   => "firstName",
      :last_name    => "lastName",
      :title        => "title",
      :organization => "organization",
      :city         => "city",
      :country      => "country",
      :state        => "state",
      :zip          => "zip",
      :list_id      => "listID",
      :status       => "status",
    }.freeze


    # http://api.elasticemail.com/public/help#Contact_QuickAdd
    class QuickAddContact < Struct.new(*QUICK_ADD_CONTACT_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/contact/quickadd"
      end

      def mapping
        QUICK_ADD_CONTACT_ATTRIBUTES_MAPPING
      end
    end
  end
end
