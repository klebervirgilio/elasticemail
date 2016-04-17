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

      def perform!
        raise Elasticemail::Errors::PayloadNotValid, 'comma separated emails or rule must be provide' if payload_valid?
        # it will always return success doesn't matter if the payload is valid or not
        perform
      end

      def payload_valid?
        emails.nil? && rule.nil?
      end

      def path
        :"/contact/delete"
      end

      def mapping
        DELETE_CONTACT_ATTRIBUTES_MAPPING
      end
    end
  end
end
