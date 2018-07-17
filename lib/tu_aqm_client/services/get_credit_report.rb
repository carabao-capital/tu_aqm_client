module TuAqmClient
  module Services
    class ResponseError < StandardError; end
    class MissingFieldsError < StandardError; end

    class GetCreditReport
      attr_accessor :request_body

      def initialize(params)
        current_date = DateFormatter::format(DateTime.now.to_date)

        request_params = params.merge({
          application_receipt_date: current_date,
          current_date: current_date,
          bureau_request_type: 'prod',
          enquiry_account_type: '3000',
          inquiry_amount: '1',
        })

        @request_body = TuAqmClient::Request::ExecuteXmlString.new(request_params)
      end

      def execute
        response = request_body.execute

        build_credit_report(response)
      end

      private

      def build_credit_report(response)
        response_hash = Saxerator.parser(response.body)
        execute_xml_string_result = response_hash.
          for_tag("s:Body").
          first["ExecuteXMLStringResponse"]["ExecuteXMLStringResult"]

        dc_response_parser = Saxerator.parser(execute_xml_string_result)

        raise_response_error(dc_response_parser)

        xmls = extract_xmls(dc_response_parser)

        raise_missing_field_error(xmls)

        extract_credit_report(xmls)
      end

      # Collects XML files. Ignores non-xmls
      def extract_xmls(dc_response_parser)
        dc_response = dc_response_parser.for_tag("DCResponse").
          first["ContextData"]["Field"]

        dc_response.map do |e|
          begin
            Hash.from_xml(e)
          rescue
          end
        end.compact
      end

      def extract_credit_report(xmls)
        xmls.find do |xml|
          xml.keys.include? "CreditReport"
        end
      end

      def raise_missing_field_error(xmls)
        xmls.each do |xml|
          if xml["ReasonsTrail"]
            raise(
              MissingFieldsError,
              xml.to_json,
            )
          end
        end
      end

      def raise_response_error(dc_response_parser)
        dc_response = dc_response_parser.for_tag("DCResponse").first

        raise(
          ResponseError,
          dc_response.to_json
        ) if dc_response["Status"] == "Failed" ||
          dc_response["Status"] == "Exception"
      end
    end
  end
end
