module Elasticemail
  module Domain

    VERIFY_MX_ATTRIBUTES_MAPPING = {
      :api_key => "apikey",
      :domain  => "domain",
    }.freeze


    # http://api.elasticemail.com/public/help#Domain_VerifyMX
    class VerifyMx < Struct.new(*VERIFY_MX_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/domain/verifymx"
      end

      def mapping
        VERIFY_MX_ATTRIBUTES_MAPPING
      end
    end
  end
end
