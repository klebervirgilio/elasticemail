module Elasticemail
  module Email

    SEND_EMAIL_ATTRIBUTES_MAPPING = {
      :api_key               => "apikey",
      :subject               => "subject",
      :from                  => "from",
      :from_name             => "from_name",
      :sender                => "sender",
      :sender_name           => "sender_name",
      :msg_from              => "msg_from",
      :msg_from_name         => "msg_from_name",
      :reply_to              => "reply_to",
      :reply_to_email        => "reply_to_email",
      :to                    => "to",
      :msg_to                => "msg_to",
      :msg_cc                => "msg_cc",
      :msg_bcc               => "msg_bcc",
      :lists                 => "lists",
      :segments              => "segments",
      :merge_source_filename => "mergesourcefilename",
      :channel               => "channel",
      :body_html             => "body_html",
      :body_text             => "body_text",
      :charset               => "charset",
      :encoding_type         => "encodingtype",
      :template              => "template",
      :attachment_files      => "attachmentfiles",
      :headers               => "headers",
      :post_back             => "postback",
      :merge                 => "merge",
      :time_offset_minutes   => "time_offset_minutes"
    }.freeze

    # http://api.elasticemail.com/public/help#Email_Send
    class SendEmail < Struct.new(*SEND_EMAIL_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/email/send"
      end

      def mapping
        SEND_EMAIL_ATTRIBUTES_MAPPING
      end
    end

  end
end
