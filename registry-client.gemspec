# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'registry/client/version'

Gem::Specification.new do |spec|
  spec.name          = "registry-client"
  spec.version       = Registry::Client::VERSION
  spec.authors       = ["mose"]
  spec.email         = ["mose@faria.co"]
  spec.description   = %q{Ruby client library for SSO on Registry server.}
  spec.summary       = %q{Ruby client library for SSO on Registry server.}
  spec.homepage      = "https://github.com/eduvo/registry-client"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
