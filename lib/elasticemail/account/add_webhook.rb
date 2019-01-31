module Elasticemail
  module Account

    ADD_WEBHOOK_ATTRIBUTES_MAPPING = {
      api_key:      'apikey',                      # Required
      name:         'name',                        # Required
      url:          'webNotificationUrl',          # Required
      abuse:        'notificationForAbuseReport',
      clicked:      'notificationForClicked',
      error:        'notificationForError',
      opened:       'notificationForOpened',
      sent:         'notificationForSent',
      unsubscribed: 'notificationForUnsubscribed',
      notify_once:  'notifyOncePerEmail'
    }.freeze


    # https://api.elasticemail.com/public/help#Account_AddWebhook
    class AddWebhook < Struct.new(*ADD_WEBHOOK_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :'/account/addwebhook'
      end

      def mapping
        ADD_WEBHOOK_ATTRIBUTES_MAPPING
      end
    end
  end
end
