module Elasticemail
  module Account

    UPDATE_HTTP_NOTIFICATION_ATTRIBUTES_MAPPING = {
      :api_key  => "apikey",
      :settings => "settings",
      :url      => "url",
    }.freeze


    # http://api.elasticemail.com/public/help#Account_UpdateHttpNotification
    class UpdateHttpNotificationAccount < Struct.new(*UPDATE_HTTP_NOTIFICATION_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      attr_accessor :sent, :opened, :clicked, :unsubscribed, :complaints, :error

      def path
        :"/account/updatehttpnotification"
      end

      def settings
        {
          sent: !!@sent,
          opened: !!@opened,
          clicked: !!@clicked,
          unsubscribed: !!@unsubscribed,
          complaints: !!@complaints,
          error: !!@error
        }.to_json
      end

      def mapping
        UPDATE_HTTP_NOTIFICATION_ATTRIBUTES_MAPPING
      end
    end
  end
end
