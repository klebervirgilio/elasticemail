# Elasticemail

A Elastic Email HTTP API Ruby wrapper

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'elasticemail', git: "git://github.com/klebervirgilio/elasticemail.git"
```

And then execute:

    $ bundle

## Usage

```ruby
# Add an account
Elasticemail::Accounts.add do |account|
  account.email            = 'email@example.com'
  account.password         = 'p4550rD!'
  account.confirm_password = 'p4550rD!'

  account.marketing_type!
end

# Delete an account
Elasticemail::Accounts.delete do |delete_account|
  delete_account.notify            = false
  delete_account.public_account_id = 'account.publicaccountid'
end

# Load an account
Elasticemail::Accounts.find('account.apikey')

# Load update http notification url
Elasticemail::Accounts.update_http_notification_url do |notification|
  notification.api_key = api_key
  notification.clicked = true
  notification.opened  = true
  notification.sent    = true
  notification.url     = "http://example.com"
end

# Add a contact
Elasticemail::Contacts.add do |contact|
  contact.email               = 'contact@email.com'
  contact.requires_activation = false
  contact.public_account_id   = 'account.publicaccountid'
end

# Delete a contact
Elasticemail::Contacts.delete do |contact|
  contact.api_key = 'account.apikey'
  contact.emails  = 'contact@email.com'
end

# Load a contact
Elasticemail::Contacts.find do |contact|
  contact.api_key = 'account.api_key'
  contact.email   = 'contact@email.com'
end

# Add an attachment
Elasticemail::Attachments.upload do |attachment|
  attachment.attachment_path = csv_file
  attachment.attachment_content_type = 'text/csv'
end

# Get an attachment
Elasticemail::Attachments.get(file_name, attachment_id, api_key)

# Remove an attachment
Elasticemail::Attachments.remove(file_name)

# Send email
Elasticemail::Emails.deliver do |email|
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
      :reply_to_name         => "replyToName",
      :segments              => "segments",
      :sender                => "sender",
      :sender_name           => "senderName",
      :subject               => "subject",
      :template              => "template",
      :time_offset_minutes   => "timeOffSetMinutes",
      :to                    => "to"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/klebervirgilio/elasticemail. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

