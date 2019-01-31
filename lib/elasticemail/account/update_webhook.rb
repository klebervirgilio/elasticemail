module Elasticemail
  module Account

    UPDATE_WEBHOOK_ATTRIBUTES_MAPPING = {
      api_key:      'apikey',                      # Required
      webook_id:    'webhookID',                   # Required
      name:         'name',
      url:          'webNotificationUrl',
      abuse:        'notificationForAbuseReport',
      clicked:      'notificationForClicked',
      error:        'notificationForError',
      opened:       'notificationForOpened',
      sent:         'notificationForSent',
      unsubscribed: 'notificationForUnsubscribed',
      notify_once:  'notifyOncePerEmail'
    }.freeze


    # http://api.elasticemail.com/public/help#Account_AddSubAccount
    class UpdateWebhook < Struct.new(*UPDATE_WEBHOOK_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :'/account/updatewebhook'
      end

      def mapping
        UPDATE_WEBHOOK_ATTRIBUTES_MAPPING
      end
    end
  end
end
