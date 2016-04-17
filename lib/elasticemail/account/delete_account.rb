module Elasticemail
  module Account

    DELETE_ACCOUNT_ATTRIBUTES_MAPPING = {
      :notify            => "notify",
      :sub_account_email => "subAccountEmail",
      :public_account_id => "publicAccountID"
    }.freeze


    # http://api.elasticemail.com/public/help#Account_DeleteSubAccount
    class DeleteAccount < Struct.new(*DELETE_ACCOUNT_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/account/deletesubaccount"
      end

      def mapping
        DELETE_ACCOUNT_ATTRIBUTES_MAPPING
      end
    end
  end
end
