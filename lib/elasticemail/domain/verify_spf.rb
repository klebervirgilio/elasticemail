module Elasticemail
  module Domain

    VERIFY_SPF_ATTRIBUTES_MAPPING = {
      :api_key => "apikey",
      :domain  => "domain",
    }.freeze


    # http://api.elasticemail.com/public/help#Domain_VerifySpf
    class VerifySpf < Struct.new(*VERIFY_SPF_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/domain/verifyspf"
      end

      def mapping
        VERIFY_SPF_ATTRIBUTES_MAPPING
      end
    end
  end
end
