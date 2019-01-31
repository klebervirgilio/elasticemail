module Elasticemail
  module Account

    DELETE_WEBHOOK_ATTRIBUTES_MAPPING = {
      api_key:   'apikey',    # Required
      webook_id: 'webhookID'  # Required
    }.freeze


    # http://api.elasticemail.com/public/help#Account_AddSubAccount
    class DeleteWebhook < Struct.new(*DELETE_WEBHOOK_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :'/account/deletewebhook'
      end

      def mapping
        DELETE_WEBHOOK_ATTRIBUTES_MAPPING
      end
    end
  end
end
