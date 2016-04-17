module Elasticemail

  module Contact

    DELETE_CONTACT_ATTRIBUTES_MAPPING = {
      :api_key => "apikey",
      :rule => "rule",
      :emails => "emails"
    }.freeze


    # http://api.elasticemail.com/public/help#Contact_Add
    class DeleteContact < Struct.new(*DELETE_CONTACT_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base
      class ParamsNotValid < StandardError; end


      def perform
        raise Elasticemail::Errors::PayloadNotValid, 'comma separated emails or rule must be provide' if emails.nil? && rule.nil?
        # it will always returns success doesn't matter if the payload is valid or not
        super
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
