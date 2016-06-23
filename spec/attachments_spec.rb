require 'spec_helper'

describe Elasticemail::Attachments do
  describe '.upload' do
    it 'uploads a new attachment' do
      csv = StringIO.new(<<-EOF, "r")
      email,firstName,lastName
      example@example.com,First Name,Last Name
      EOF

      resp = Elasticemail::Attachments.upload do |attachment|
        attachment.attachment_path = csv
        attachment.attachment_content_type = 'text/csv'
      end

      expect(resp).to be_success
    end
  end

  describe '.get' do
    it 'gets uploaded attachment' do
      csv = StringIO.new(<<-EOF, "r")
      email,firstName,lastName
      example@example.com,First Name,Last Name
      EOF

      resp = Elasticemail::Attachments.upload do |attachment|
        attachment.attachment_path = csv
        attachment.attachment_content_type = 'text/csv'
      end

      resp = Elasticemail::Attachments.get(resp.data["filename"], resp.data["id"])
      expect(resp.data).to eq(<<-EOF)
      email,firstName,lastName
      example@example.com,First Name,Last Name
      EOF
    end
  end

  describe '.remove' do
    it 'removes attachment' do
      csv = StringIO.new(<<-EOF, "r")
      email,firstName,lastName
      example@example.com,First Name,Last Name
      EOF

      resp = Elasticemail::Attachments.upload do |attachment|
        attachment.attachment_path = csv
        attachment.attachment_content_type = 'text/csv'
      end

      resp = Elasticemail::Attachments.remove(resp.data["filename"])
      expect(resp).to be_success
    end
  end
end
