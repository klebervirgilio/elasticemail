require 'spec_helper'

describe Elasticemail::Emails do
  describe 'deliver' do
    context 'merge var', vcr: { cassette_name: 'emails/send_email_success', record: :new_episodes } do
      it 'merges vars' do

csv = StringIO.new(<<-EOF, "r")
email,firstName,lastName
example@example.com,First Name,Last Name
EOF

        Elasticemail::Attachments.upload do |attachment|
          attachment.attachment_path = csv
          attachment.attachment_content_type = 'text/csv'
        end

      end
    end
  end
end
