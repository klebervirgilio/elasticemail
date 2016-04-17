module Elasticemail
  module Contact

    ADD_CONTACT_ATTRIBUTES_MAPPING = {
      :activation_return_url => "activation_Return_Url",
      :activation_template   => "activation_Template",
      :annual_revenue        => "annualRevenue",
      :birth_date            => "birthDate",
      :city                  => "city",
      :country               => "country",
      :email                 => "email",
      :first_name            => "firstName",
      :gender                => "gender",
      :industry              => "industry",
      :last_name             => "lastName",
      :list_name             => "listName",
      :mobile_number         => "mobileNumber",
      :notes                 => "notes",
      :number_of_employees   => "numberOfEmployees",
      :organization_name     => "organizationName",
      :phone                 => "phone",
      :postal_code           => "postalCode",
      :public_account_id     => "publicAccountID", # * required
      :public_list_id        => "publicListID",
      :requires_activation   => "requiresActivation",
      :return_url            => "return_Url",
      :source_url            => "source_Url",
      :state                 => "state",
      :title                 => "title",
      :type                  => "type",
      :website               => "website",
    }.freeze


    # http://api.elasticemail.com/public/help#Contact_Add
    class AddContact < Struct.new(*ADD_CONTACT_ATTRIBUTES_MAPPING.keys)
      include Elasticemail::Base

      def path
        :"/contact/add"
      end

      def mapping
        ADD_CONTACT_ATTRIBUTES_MAPPING
      end
    end
  end
end
