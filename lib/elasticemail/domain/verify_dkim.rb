module Elasticemail
  module Domain

    VERIFY_DKIM_ATTRIBUTES_MAPPING = {
      :api_key => "apikey",
      :domain  => "domain",
    }.freeze


    # http://api.elasticemail.com/public/help#Domain_VerifyDkim
    class VerifyDkim < Struct.new(*VERIFY_DKIM_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/domain/verifydkim"
      end

      def mapping
        VERIFY_DKIM_ATTRIBUTES_MAPPING
      end
    end
  end
end
