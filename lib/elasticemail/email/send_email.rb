module Elasticemail
  module Email

    SEND_EMAIL_ATTRIBUTES_MAPPING = {
      :api_key               => "apikey",
      :attachment_files      => "attachmentFiles",
      :body_html             => "bodyHtml",
      :body_text             => "bodyText",
      :channel               => "channel",
      :charset               => "charset",
      :data_source           => "data_source",
      :encoding_type         => "encodingType",
      :from                  => "from",
      :from_name             => "fromName",
      :headers               => "headers",
      :lists                 => "lists",
      :merge                 => "merge",
      :merge_source_filename => "mergeSourceFilename",
      :msg_bcc               => "msgBcc",
      :msg_cc                => "msgCC",
      :msg_from              => "msgFrom",
      :msg_from_name         => "msgFromName",
      :msg_to                => "msgTo",
      :post_back             => "postBack",
      :reply_to              => "replyTo",
      :reply_to_email        => "reply_to_email",
      :segments              => "segments",
      :sender                => "sender",
      :sender_name           => "senderName",
      :subject               => "subject",
      :template              => "template",
      :time_offset_minutes   => "timeOffSetMinutes",
      :to                    => "to",
    }.freeze

    # http://api.elasticemail.com/public/help#Email_Send
    class SendEmail < Struct.new(*SEND_EMAIL_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def perform
        super do
          session.post do |request|
            request.path   = [version, path].join('/')
            request.params = { "apikey" => api_key || _api_key }
            request.body   = build_params
          end
        end
      end

      def path
        :"/email/send"
      end

      def mapping
        SEND_EMAIL_ATTRIBUTES_MAPPING
      end
    end

  end
end
