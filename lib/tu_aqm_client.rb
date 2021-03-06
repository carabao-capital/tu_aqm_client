require "httparty"
require "htmlentities"
require "saxerator"
require "active_support"
require "active_support/core_ext"
require "active_model"
require "date"
require "i18n"

require "tu_aqm_client/version"
require "tu_aqm_client/base_request"
require "tu_aqm_client/request/execute_xml_string"
require "tu_aqm_client/services/get_credit_report"
require "tu_aqm_client/models/user"
require "tu_aqm_client/helpers/date_formatter"

module TuAqmClient
  def self.get_credit_report(params)
    Services::GetCreditReport.new(params).execute
  end
end
