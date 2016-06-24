require 'spec_helper'

describe Elasticemail::Emails do
  describe 'deliver', vcr: { cassette_name: 'emails/send_email_success', record: :new_episodes } do
    # context 'merge var', vcr: { cassette_name: 'emails/send_email_success', record: :new_episodes } do
    #   it 'merges vars' do

    #     csv = StringIO.new(<<-EOF, "r")
    #     email,firstName,lastName
    #     example@example.com,First Name,Last Name
    #     EOF

    #     Elasticemail::Attachments.upload do |attachment|
    #       attachment.attachment_path = csv
    #       attachment.attachment_content_type = 'text/csv'
    #     end

    #   end
    # end

    subject do
      Elasticemail::Emails.deliver do |email|
        email.charset        = 'utf-8'
        email.post_back      = 'http://requestb.in/u5vajtu5'
        email.reply_to_name  = 'kleber bikeroar'
        email.channel        = 'newsletter'
        email.reply_to       = 'kleber@bikeroar.com'
        email.from_name      = 'kleber correia'
        email.sender         = 'kleber@toptal.com'
        email.from           = 'kleber@bikeroar.com'
        email.to             = 'klebervirgilio@gmail.com, kleber@bikeroar.com, kleber@toptal.com'
        email.msg_to         = 'kleber@bikeroar.com, kleber@toptal.com'
        email.msg_cc         = 'kleber@bikeroar.com, kleber@toptal.com'
        email.subject        = '[test] subject'
        email.body_html      = '<h1>hi</h1><a href="http://www.google.com">***link...</a>'
        email.body_text      = 'hi'

        email.add_header "Custom1", "Custom Header 1"
        email.add_header "Custom2", "Custom Header 2"
      end
    end

    it 'sends an email' do
      is_expected.to be_success
    end
  end
end
