module Elasticemail
  module Account

    FIELDS_PRESENCE_REQUIRED = %w[
      first_name
      last_name
      address_2
      delivery_reason
    ]

    ACCOUNT_UPDATE_PROFILE_ATTRIBUTES_MAPPING = {
      :address_1         => "address1",
      :address_2         => "address2",
      :api_key           => "apikey",
      :city              => "city",
      :company           => "company",
      :country_id        => "countryID",
      :delivery_reason   => "deliveryReason",
      :first_name        => "firstName",
      :last_name         => "lastName",
      :logo_url          => "logoUrl",
      :marketing_consent => "marketingConsent",
      :phone             => "phone",
      :state             => "state",
      :tax_code          => "taxCode",
      :website           => "website",
      :zip               => "zip",
      :post_code         => "zip",
      :postal_code       => "zip",
      :zip_code          => "zip",
    }.freeze


    # http://api.elasticemail.com/public/help#Account_UpdateProfile
    class UpdateProfileAccount < Struct.new(*ACCOUNT_UPDATE_PROFILE_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def initialize(*args)
        super(*args)
        initialize_required_fileds
        self.marketing_consent = 'false'
      end

      def path
        :"/account/updateprofile"
      end

      def mapping
        ACCOUNT_UPDATE_PROFILE_ATTRIBUTES_MAPPING
      end

      private
      def initialize_required_fileds
        FIELDS_PRESENCE_REQUIRED.each { |field| public_send("#{field}=", "") }
      end
    end
  end
end
