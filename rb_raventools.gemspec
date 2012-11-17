# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rb_raventools/version'

Gem::Specification.new do |gem|
  gem.name          = "rb_raventools"
  gem.version       = RavenTools::VERSION
  gem.authors       = ["Kevin Wanek"]
  gem.email         = ["kdub@itriagehealth.com"]
  gem.description   = %q{Use the RavenTools SEO API to retrieve any account, domain, keyword related information offered.}
  gem.summary       = %q{An unofficial ruby wrapper for the RavenTools SEO API. Requires an account with RavenTools and an API Key.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'json'
end
