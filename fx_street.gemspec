# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fx_street/version'

Gem::Specification.new do |spec|
  spec.name          = "fx_street"
  spec.version       = FxStreet::VERSION
  spec.authors       = ["Eric Kelly"]
  spec.email         = ["heroiceric@gmail.com"]
  spec.summary       = %q{Wrapper for the FXstreet API}
  spec.description   = %q{Wrapper for the FXstreet API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "faraday", "~> 0.9.0"
  spec.add_dependency "faraday_middleware", "~> 0.9.0"
  spec.add_dependency "rash", "~> 0.4.0"
end
