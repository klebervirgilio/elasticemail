# $LOAD_PATH.unshift File.expand_path('..', __FILE__)

require "elasticemail/version"

require "faraday"
require "elasticemail/errors"
require "elasticemail/base"

# Account
require "elasticemail/account/add_account"
require "elasticemail/account/delete_account"
require "elasticemail/account/get_subaccount_list"
require "elasticemail/accounts"

# Contact
require "elasticemail/contact/add_contact"
require "elasticemail/contact/delete_contact"
require "elasticemail/contacts"



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
      api_key: nil
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
