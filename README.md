# TU AQM Client

Gem for connecting to Transunion's AQM System for retrieving credit reports.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tu_aqm_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tu_aqm_client

## Usage

### Set the env variables

```
TU_AQM_ENDPOINT="https://tu_aqm_endpoint.svc"
```

### To retrieve a credit report:

```
TuAqmClient::get_credit_report(
  user_id: "user_id",
  password: "password",
  first_name: "Willie",
  last_name: "Diaz",
  gender: "m",
  date_of_birth: Date.parse("12/29/1980"),
  civil_status: "married",
  id_type: "TIN",
  id_number: "764492040",
  address_type: "R",
  address: "02 8TH CROSSING LOURDES PHILIPPINES",
  contact_number: "1111111",
  email_address: "wdiaze7@fastcompany.com",
)
```

### Notes
1. `user_id` and `password` are given by Transunion
2. `address` only accepts alphanumeric values

`TuAqmClient::get_credit_report` will then return the credit report as shown in sample_credit_report.md

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
