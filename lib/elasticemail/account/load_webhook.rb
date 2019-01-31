module Elasticemail
  module Account

    LOAD_WEBHOOK_ATTRIBUTES_MAPPING = {
      api_key: 'apikey'
    }.freeze


    # http://api.elasticemail.com/public/help#Account_AddSubAccount
    class LoadWebhook < Struct.new(*LOAD_WEBHOOK_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :'/account/loadwebhook'
      end

      def mapping
        LOAD_WEBHOOK_ATTRIBUTES_MAPPING
      end
    end
  end
end
