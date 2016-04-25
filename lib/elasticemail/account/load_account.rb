module Elasticemail
  module Account

    ACCOUNT_LOAD_ATTRIBUTES_MAPPING = {
      :api_key => "apikey",
    }.freeze


    # http://api.elasticemail.com/public/help#Account_Load
    class LoadAccount < Struct.new(*ACCOUNT_LOAD_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/account/load"
      end

      def mapping
        ACCOUNT_LOAD_ATTRIBUTES_MAPPING
      end
    end
  end
end
