module TuAqmClient
  module Models
    class User
      attr_accessor :first_name
      attr_accessor :last_name
      attr_accessor :date_of_birth
      attr_accessor :id_type
      attr_accessor :id_number
      attr_accessor :address_type
      attr_accessor :address
      attr_accessor :contact_number_type
      attr_accessor :contact_number
      attr_accessor :postal_zip_code
      attr_accessor :country_code
      attr_accessor :area_code
      attr_accessor :company_name
      attr_accessor :email_address

      attr_writer :gender, :civil_status

      def initialize(
        first_name: ,
        last_name: ,
        gender: 3,
        date_of_birth: ,
        civil_status: 'U',
        id_type: '',
        id_number: '',
        address_type: 'R',
        postal_zip_code: '0000',
        country_code: '63',
        area_code: '0',
        company_name: 'None',
        email_address: '',
        address: '',
        contact_number_type: 'R',
        contact_number: '0000000'
      )
        @first_name = first_name
        @last_name = last_name
        @gender = gender
        @date_of_birth = DateFormatter::format(date_of_birth)
        @civil_status = civil_status
        @id_type = id_type
        @id_number = id_number
        @address_type = address_type
        @address = address
        @contact_number_type = contact_number_type
        @contact_number = contact_number
        @postal_zip_code = postal_zip_code
        @country_code = country_code
        @area_code = area_code
        @company_name = company_name
        @email_address = email_address
      end
    end

  end
end
