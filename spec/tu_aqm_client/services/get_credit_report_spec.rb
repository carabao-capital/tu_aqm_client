require "spec_helper"

module TuAqmClient
  module Services
    describe GetCreditReport, ".execute" do
      let(:user_id) { ENV["TU_AQM_USERID"] }
      let(:password) { ENV["TU_AQM_PASSWORD"] }
      let(:first_name) { "Marie" }
      let(:last_name) { "Lynch" }
      let(:gender) { "f" }
      let(:date_of_birth) { Date.parse('1981-03-20') }
      let(:civil_status) { 'Married' }
      let(:id_type) { "TIN" }
      let(:id_number) { "111143223" }
      let(:address) { "MOCKINGBIRD TRAIL SAN LUIS" }
      let(:contact_number) { "4213321" }
      let(:email_address) { "neil@email.com" }

      let(:credit_report) do
        TuAqmClient::Services::GetCreditReport.new(
          user_id: user_id,
          password: password,
          first_name: first_name,
          last_name: last_name,
          gender: gender,
          date_of_birth: date_of_birth,
          civil_status: civil_status,
          id_type: id_type,
          id_number: id_number,
          address: address,
          contact_number: contact_number,
          email_address: email_address,
        ).execute
      end

      it "executes", vcr: {record: :once} do
        expect( credit_report.keys ).to eq(["CreditReport"])
      end

      # VCR dependent
      it "throws a MissingFieldError", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end

      # VCR dependent
      it "throws an RequestError for wrong username", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::ResponseError
      end

      # VCR dependent
      it "throws an RequestError for wrong password", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::ResponseError
      end

      # VCR dependent
      it "throws an RequestError for wrong ExecutionMode", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::ResponseError
      end

      # VCR dependent
      it "throws an RequestError for wrong SolutionSetId", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::ResponseError
      end

      # VCR dependent
      it "throws an RequestError for wrong ExecuteLatestVersion", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::ResponseError
      end

      # VCR dependent
      it "throws an RequestError for wrong ApplicationReceiptDate", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::ResponseError
      end

      # VCR dependent
      it "throws an RequestError for wrong ApplicationReceiptDate", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::ResponseError
      end

      # VCR dependent
      it "throws an RequestError for wrong EnquiryAccountType", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end

      # VCR dependent
      it "throws an error for wrong InquiryAmount", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end

      # VCR dependent
      it "throws an error for wrong Product", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end

      # VCR dependent
      it "throws an error for wrong SubProduct", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end

      # VCR dependent
      it "throws an error for wrong BCLib_BureauRequestType", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end

      # VCR dependent
      it "throws an error for wrong EmploymentStatus", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end

      it "throws an error for wrong FirstName", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end

      it "throws an error for wrong LastName", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end

      it "throws an error for wrong Gender", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end

      it "throws an error for wrong DateOfBirth", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end

      it "throws an error for wrong IDNumber", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end

      it "throws an error for wrong AddressType", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end

      it "throws an error for wrong AddressLine1", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end

      it "throws an error for wrong ContactNumberType", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end

      it "throws an error for wrong ContactNumber", vcr: {record: :once} do
        expect { credit_report }.to raise_error TuAqmClient::Services::MissingFieldsError
      end
    end
  end
end
