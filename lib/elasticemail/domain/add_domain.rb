module Elasticemail
  module Domain

    ADD_DOMAIN_ATTRIBUTES_MAPPING = {
      :api_key => "apikey",
      :domain  => "domain",
    }.freeze


    # http://api.elasticemail.com/public/help#Domain_Add
    class AddDomain < Struct.new(*ADD_DOMAIN_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/domain/add"
      end

      def mapping
        ADD_DOMAIN_ATTRIBUTES_MAPPING
      end
    end
  end
end
