module Elasticemail
  module Account

    ACCOUNT_LIST_ATTRIBUTES_MAPPING = {
      :api_key => "apikey",
    }.freeze


    # http://api.elasticemail.com/public/help#Account_AddSubAccount
    class GetSubAccountList < Struct.new(*ACCOUNT_LIST_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/account/getsubaccountlist"
      end

      def mapping
        ACCOUNT_LIST_ATTRIBUTES_MAPPING
      end
    end
  end
end
