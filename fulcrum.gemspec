# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fulcrum/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chris Hall", "Zac McCormick", "Coleman McCormick", "Jonathan Baker", "Kyle Tolle"]
  gem.email         = ["support@fulcrumapp.com"]
  gem.description   = %q{Fulcrum API Gem}
  gem.summary       = %q{Fulcrum API Gem}
  gem.homepage      = "http://github.com/spatialnetworks/fulcrum-ruby"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fulcrum"
  gem.require_paths = ["lib"]
  gem.version       = Fulcrum::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'debugger'

  gem.add_dependency 'activesupport'
  gem.add_dependency 'faraday'
  gem.add_dependency 'hashie'
  gem.add_dependency 'faraday_middleware'
end
