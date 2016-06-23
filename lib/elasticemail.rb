require "elasticemail/version"

require "faraday"
require "elasticemail/errors"
require "elasticemail/base"

# Account
require "elasticemail/account/add_account"
require "elasticemail/account/delete_account"
require "elasticemail/account/load_account"
require "elasticemail/accounts"

# Attachment
require "elasticemail/attachment/upload"
require "elasticemail/attachment/remove_attachment"
require "elasticemail/attachment/get_attachment"
require "elasticemail/attachments"

# Contact
require "elasticemail/contact/add_contact"
require "elasticemail/contact/quick_add_contact"
require "elasticemail/contact/delete_contact"
require "elasticemail/contact/load_contact"
require "elasticemail/contacts"

# Emails
require "elasticemail/email/send_email"
require "elasticemail/emails"

# Domains
require "elasticemail/domain/add_domain"
require "elasticemail/domain/verify_dkim"
require "elasticemail/domain/verify_spf"
require "elasticemail/domain/verify_mx"
require "elasticemail/domains"


require "elasticemail/web_notification/notification"



module Elasticemail
  extend self

  ELASTIC_EMAIL_API_HOST    = "https://api.elasticemail.com"
  ELASTIC_EMAIL_API_VERSION = "v2"

  def configure
    yield self
  end

  def settings
    @settings ||= {
      version: ELASTIC_EMAIL_API_VERSION,
      host:    ELASTIC_EMAIL_API_HOST,
      timeout: 60,
      api_key: ENV['ELASTIC_EMAIL_API_KEY']
    }
  end

  def timeout=(timeout)
    settings[:timeout] = timeout.to_i
  end

  def host=(host)
    settings[:host] = host
  end

  def api_key=(api_key)
    settings[:api_key] = api_key
  end

  def version=(version)
    settings[:version] = version
  end

  def [](key)
    settings.fetch(key)
  end
end
