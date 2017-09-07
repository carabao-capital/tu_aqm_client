module TuAqmClient
  module Request
    class ExecuteXmlString < BaseRequest
      attr_accessor :user_id
      attr_accessor :password
      attr_accessor :application_receipt_date
      attr_accessor :current_date
      attr_accessor :first_name
      attr_accessor :last_name
      attr_accessor :gender
      attr_accessor :date_of_birth
      attr_accessor :civil_status
      attr_accessor :id_type
      attr_accessor :id_number
      attr_accessor :address_type
      attr_accessor :address
      attr_accessor :contact_number_type
      attr_accessor :contact_number

      SOAP_ACTION = "http://tempuri.org/IExternalSolutionExecution/ExecuteXMLString"

      def initialize(
        user_id:,
        password:,
        application_receipt_date:,
        current_date:,
        first_name:,
        last_name:,
        gender:,
        date_of_birth:,
        civil_status:,
        id_type:,
        id_number:,
        address_type:,
        address:,
        contact_number_type:,
        contact_number:
      )

        @user_id = user_id
        @password = password
        @application_receipt_date = application_receipt_date
        @current_date = current_date
        @first_name = first_name
        @last_name = last_name
        @gender = gender
        @date_of_birth = date_of_birth
        @civil_status = civil_status
        @id_type = id_type
        @id_number = id_number
        @address_type = address_type
        @address = address
        @contact_number_type = contact_number_type
        @contact_number = contact_number
      end

      def body
        "<?xml version=\"1.0\"?><s:Envelope xmlns:s=\"http://schemas.xmlsoap.org/soap/envelope/\"><s:Body><ExecuteXMLString xmlns=\"http://tempuri.org/\"><request>#{dc_request}</request></ExecuteXMLString></s:Body></s:Envelope>"
      end

      private

      def dc_request
        HTMLEntities.new.encode(
          "<DCRequest
              xmlns=\"http://transunion.com/dc/extsvc\">
              <Authentication type=\"OnDemand\">
                  <UserId>#{user_id}</UserId>
                  <Password>#{password}</Password>
              </Authentication>
              <RequestInfo>
                  <ExecutionMode>NewWithContext</ExecutionMode>
                  <SolutionSetId>97</SolutionSetId>
                  <ExecuteLatestVersion>true</ExecuteLatestVersion>
              </RequestInfo>
              <Fields>
                  <Field key=\"ApplicationReceiptDate\">#{application_receipt_date}</Field>
                  <Field key=\"Channel\">1</Field>
                  <Field key=\"CurrencyCode\">PHP</Field>
                  <Field key=\"CurrentDate\">#{current_date}</Field>
                  <Field key=\"EnquiryAccountType\"></Field>
                  <Field key=\"InquiryAmount\"></Field>
                  <Field key=\"Product\"></Field>
                  <Field key=\"SubProduct\"></Field>
                  <Field key=\"BCLib_BureauRequestType\">uat</Field>
                  <Field key=\"Applicants\">
                      <![CDATA[
                          <object>
                              <Applicant>
                                  <Title>1</Title>
                                  <FirstName>#{first_name}</FirstName>
                                  <MiddleName></MiddleName>
                                  <LastName>#{last_name}</LastName>
                                  <Gender>#{gender}</Gender>
                                  <DateOfBirth>#{date_of_birth}</DateOfBirth>
                                  <PlaceOfBirth></PlaceOfBirth>
                                  <CivilStatus>#{civil_status}</CivilStatus>
                                  <IdType>#{id_type}</IdType>
                                  <IdNumber>#{id_number}</IdNumber>
                                  <IdExpireDate></IdExpireDate>
                                  <Citizenship></Citizenship>
                                  <NumberOfDependants></NumberOfDependants>
                                  <CarOwnership />
                                  <HomeOwnership />
                                  <YearsOfResidence></YearsOfResidence>
                                  <MothersMaidenName></MothersMaidenName>
                                  <AddressType>#{address_type}</AddressType>
                                  <AddressLine1>#{address}</AddressLine1>
                                  <AddressLine2></AddressLine2>
                                  <AddressLine3></AddressLine3>
                                  <AddressLine4></AddressLine4>
                                  <PostalZipCode></PostalZipCode>
                                  <Country>PHL</Country>
                                  <ContactNumberType>#{contact_number_type}</ContactNumberType>
                                  <CountryCode></CountryCode>
                                  <AreaCode></AreaCode>
                                  <PhoneNumber>#{contact_number}</PhoneNumber>
                                  <Extension></Extension>
                                  <EmailAddress></EmailAddress>
                                  <EmploymentType></EmploymentType>
                                  <EmploymentStatus></EmploymentStatus>
                                  <NatureOfBusiness></NatureOfBusiness>
                                  <Occupation></Occupation>
                                  <CompanyName></CompanyName>
                                  <EmploymentTimeYears></EmploymentTimeYears>
                                  <EmploymentTimeMonths></EmploymentTimeMonths>
                                  <YearsInBusiness></YearsInBusiness>
                                  <GrossAnnualIncome></GrossAnnualIncome>
                                  <GrossMonthlyIncome></GrossMonthlyIncome>
                                  <EmploymentCurrencyCode></EmploymentCurrencyCode>
                                  <PositionLevel />
                                  <PositionTitle></PositionTitle>
                                  <SourceOfFunds />
                                  <AliasFirstName></AliasFirstName>
                                  <AliasMiddleName></AliasMiddleName>
                                  <AliasLastName></AliasLastName>
                                  <AliasMothersMaidenName></AliasMothersMaidenName>
                                  <BankCode></BankCode>
                                  <CardReferenceNo></CardReferenceNo>
                                  <CarMake></CarMake>
                                  <CarModel></CarModel>
                                  <SumOfAssets></SumOfAssets>
                                  <EducationLevel />
                              </Applicant>
                          </object>
                      ]]>
                  </Field>
                 <Field key=\"Const_FolderPath\">C:LocalizationSimfiles</Field>
              </Fields>
          </DCRequest>".gsub("\n", "")
        )
      end
    end
  end
end