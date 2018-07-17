# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tu_aqm_client/version"

Gem::Specification.new do |spec|
  spec.name          = "tu_aqm_client"
  spec.version       = TuAqmClient::VERSION
  spec.authors       = ["Neil Marion dela Cruz"]
  spec.email         = ["nmfdelacruz@gmail.com"]

  spec.summary       = %q{Connects to TU AQM System}
  spec.description   = %q{Connects to TU AQM System}
  spec.homepage      = "https://github.com/carabao-capital/tu_aqm_client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"
  spec.add_dependency "htmlentities"
  spec.add_dependency "activesupport"
  spec.add_dependency "activemodel"
  spec.add_dependency "saxerator"

  spec.add_development_dependency("vcr", "~> 3.0.1")
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "dotenv"
end
