module Elasticemail
  module Account

    ADD_ACCOUNT_ATTRIBUTES_MAPPING = {
      :account_type            => "accountType",
      :confirm_password        => "confirmPassword",
      :daily_send_limit        => "dailySendLimit",
      :email                   => "email",
      :enable_contact_features => "enableContactFeatures",
      :enable_litmus_test      => "enableLitmusTest",
      :max_contacts            => "maxContacts",
      :password                => "password",
      :requires_email_credits  => "requiresEmailCredits",
      :requires_litmus_credits => "requiresLitmusCredits",
      :return_url              => "return_Url",
      :send_activation         => "sendActivation",
      :sending_permission      => "sendingPermission",
    }.freeze


    # http://api.elasticemail.com/public/help#Account_AddSubAccount
    class AddAccount < Struct.new(*ADD_ACCOUNT_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      ACCOUNT_TYPES = {
        transactional_email: ACCOUNT_TYPE_TRANSACTIONAL_EMAIL = 1,
        marketing_email:     ACCOUNT_TYPE_MARKETING_EMAIL = 2
      }.freeze

      def marketing_type!
        self.account_type = ACCOUNT_TYPE_MARKETING_EMAIL
      end

      def transactional_type!
        self.account_type = ACCOUNT_TYPE_TRANSACTIONAL_EMAIL
      end

      def path
        :"/account/addsubaccount"
      end

      def mapping
        ADD_ACCOUNT_ATTRIBUTES_MAPPING
      end
    end
  end
end
