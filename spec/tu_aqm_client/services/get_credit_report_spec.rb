require "spec_helper"

module TuAqmClient
  module Services
    describe GetCreditReport, ".execute" do
      let(:user_id) { ENV["TU_AQM_USERID"] }
      let(:password) { ENV["TU_AQM_PASSWORD"] }
      let(:first_name) { "Gerry" }
      let(:last_name) { "Abanilla" }
      let(:gender) { 'm' }
      let(:date_of_birth) { Date.parse('1981-03-20') }
      let(:civil_status) { 'M' }
      let(:id_type) { "TIN" }
      let(:id_number) { "158805649" }
      let(:address) do
        "Occupational safety and health center compound" \
        "north ave cor agham road diliman quezon city"
      end
      let(:email_address) { "laiya.gourmet@yahoo.com" }

      let(:credit_report) do
        user = TuAqmClient::Models::User.new(
          first_name: first_name,
          last_name: last_name,
          gender: gender,
          date_of_birth: date_of_birth,
          civil_status: civil_status,
          id_type: id_type,
          id_number: id_number,
          address: address,
          email_address: email_address,
        )

        TuAqmClient::Services::GetCreditReport.new(
          user.as_param.merge({
            user_id: user_id,
            password: password,
          })
        ).execute
      end

      it "executes", vcr: { record: :once } do
        expect( credit_report.keys ).to eq(["CreditReport"])
      end

    end
  end
end
