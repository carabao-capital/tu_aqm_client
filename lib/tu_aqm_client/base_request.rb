module TuAqmClient
  class BaseRequest
    HEADER = {'Content-type' => 'text/xml; charset=utf-8'}

    def execute
      response = HTTParty.post(ENV["TU_AQM_ENDPOINT"], {
        verify: false,
        headers: HEADER.merge('SOAPAction' => self.class::SOAP_ACTION),
        body: body.gsub("\n", ""),
      })

      unless response.ok?
        puts "TuAqmClient(#{response.code}) - #{response.body.to_s}"
      end

      response
    end
  end
end
