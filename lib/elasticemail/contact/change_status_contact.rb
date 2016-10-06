module Elasticemail

  module Contact

    CHANGE_STATUS_CONTACT_ATTRIBUTES_MAPPING = {
      :api_key      => "apikey",
      :emails       => "emails",
      :status       => "status",
      :all_contacts => "allContacts",
      :rule         => "rule",
    }.freeze

    # http://api.elasticemail.com/public/help#classes_ContactStatus
    ABUSE        = 3
    ACTIVE       = 0
    BOUNCED      = 1
    ENGAGED      = -1
    INACTIVE     = 4
    UNSUBSCRIBED = 2


    # http://api.elasticemail.com/public/help#Contact_ChangeStatus
    class ChangeStatusContact < Struct.new(*CHANGE_STATUS_CONTACT_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/contact/changestatus"
      end

      def mapping
        CHANGE_STATUS_CONTACT_ATTRIBUTES_MAPPING
      end
    end
  end
end
