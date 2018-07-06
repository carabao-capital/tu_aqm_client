module TuAqmClient
  module Request
    class ExecuteXmlString < BaseRequest
      attr_accessor :user_id,
                    :password,
                    :application_receipt_date,
                    :current_date,
                    :first_name,
                    :last_name,
                    :gender,
                    :date_of_birth,
                    :civil_status,
                    :id_type,
                    :id_number,
                    :id_expiration_date,
                    :address_type,
                    :address_1,
                    :address_2,
                    :address_3,
                    :address_4,
                    :contact_number_type,
                    :contact_number,
                    :bureau_request_type,
                    :enquiry_account_type,
                    :inquiry_amount,
                    :postal_zip_code,
                    :country_code,
                    :area_code,
                    :company_name,
                    :email_address,
                    :employment_type,
                    :employment_status

      SOAP_ACTION = "http://tempuri.org/IExternalSolutionExecution/ExecuteXMLString"

      def initialize(**params)
        params.each do |key, value|
          self.send("#{key}=", value || '')
        end
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
                  <Field key=\"EnquiryAccountType\">#{enquiry_account_type}</Field>
                  <Field key=\"InquiryAmount\">#{inquiry_amount}</Field>
                  <Field key=\"Product\">1</Field>
                  <Field key=\"SubProduct\">1</Field>
                  <Field key=\"BCLib_BureauRequestType\">#{bureau_request_type}</Field>
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
                                  <IdExpireDate>#{id_expiration_date}</IdExpireDate>
                                  <Citizenship>PHL</Citizenship>
                                  <NumberOfDependants></NumberOfDependants>
                                  <CarOwnership />
                                  <HomeOwnership />
                                  <YearsOfResidence></YearsOfResidence>
                                  <MothersMaidenName></MothersMaidenName>
                                  <AddressType>R</AddressType>
                                  <AddressLine1>#{address_1}</AddressLine1>
                                  <AddressLine2>#{address_2}</AddressLine2>
                                  <AddressLine3>#{address_3}</AddressLine3>
                                  <AddressLine4>#{address_4}</AddressLine4>
                                  <PostalZipCode>#{postal_zip_code}</PostalZipCode>
                                  <Country>PHL</Country>
                                  <ContactNumberType>#{contact_number_type}</ContactNumberType>
                                  <CountryCode>#{country_code}</CountryCode>
                                  <AreaCode>#{area_code}</AreaCode>
                                  <PhoneNumber>#{contact_number}</PhoneNumber>
                                  <Extension></Extension>
                                  <EmailAddress>#{email_address}</EmailAddress>
                                  <EmploymentType>#{employment_type}</EmploymentType>
                                  <EmploymentStatus>#{employment_status}</EmploymentStatus>
                                  <NatureOfBusiness>99</NatureOfBusiness>
                                  <Occupation>99</Occupation>
                                  <CompanyName>#{company_name}</CompanyName>
                                  <EmploymentTimeYears>0</EmploymentTimeYears>
                                  <EmploymentTimeMonths>0</EmploymentTimeMonths>
                                  <YearsInBusiness>0</YearsInBusiness>
                                  <GrossAnnualIncome>0</GrossAnnualIncome>
                                  <GrossMonthlyIncome>0</GrossMonthlyIncome>
                                  <EmploymentCurrencyCode>PHP</EmploymentCurrencyCode>
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
