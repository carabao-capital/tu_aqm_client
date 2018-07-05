module TuAqmClient
  module Models
    class User
      attr_accessor :first_name
      attr_accessor :last_name
      attr_accessor :date_of_birth
      attr_accessor :id_type
      attr_accessor :id_number
      attr_accessor :gender
      attr_accessor :civil_status
      attr_accessor :id_expiration_date
      attr_accessor :address_type
      attr_accessor :address_1
      attr_accessor :address_2
      attr_accessor :address_3
      attr_accessor :address_4
      attr_accessor :contact_number_type
      attr_accessor :contact_number
      attr_accessor :postal_zip_code
      attr_accessor :country_code
      attr_accessor :area_code
      attr_accessor :company_name
      attr_accessor :email_address
      attr_accessor :employment_type
      attr_accessor :employment_status

      def initialize(
        first_name: ,
        last_name: ,
        gender: 3,
        date_of_birth: ,
        civil_status: 'U',
        id_type:,
        id_number:,
        id_expiration_date: '',
        address_type: 'R',
        postal_zip_code: '0000',
        country_code: '63',
        area_code: '0',
        company_name: 'Information Not Available',
        email_address: ,
        address: ,
        contact_number_type: 'R',
        contact_number: '9999999',
        employment_type: 'S',
        employment_status: '11',
        **_
      )
        @first_name = first_name
        @last_name = last_name
        @gender = map_gender(gender)
        @date_of_birth = DateFormatter::format(date_of_birth)
        @civil_status = map_civil_status(civil_status)
        @id_type = id_type
        @id_number = format_id_number(id_type, id_number)
        @id_expiration_date = id_expiration_date
        @address_type = address_type
        @address_1, @address_2, @address_3, @address_4 = split_full_address(address)
        @contact_number_type = contact_number_type
        @contact_number = contact_number
        @postal_zip_code = postal_zip_code
        @country_code = country_code
        @area_code = area_code
        @company_name = company_name
        @email_address = email_address
        @employment_type = employment_type
        @employment_status = employment_status
      end

      def as_param
        JSON.parse(self.to_json, symbolize_names: true)
      end

      def map_civil_status(civil_status)
        case  civil_status
        when 'married' then 'M'
        when 'single' then 'S'
        else  'U'
        end
      end

      def map_gender(gender)
        case gender
        when 'f' then 1
        when 'm' then 2
        else 3
        end
      end

      def format_id_number(id_type, id_number)
        id_number = id_number.gsub(/\W/, '')

        case id_type
        when 'TIN' then id_number[0..8]
        else id_number
        end
      end

      private

      def split_full_address(address)
        address.gsub(/[^0-9a-z ]/i, '').chars.each_slice(40).map(&:join)
      end

    end
  end
end
