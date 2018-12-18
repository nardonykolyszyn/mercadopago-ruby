# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mercadopago/version'

Gem::Specification.new do |spec|
  spec.name = 'mercadopago-ruby'
  spec.version = MercadoPago::Version
  spec.authors = ['Nardo Nykolyszyn']
  spec.email = ['devpolish@protonmail.com']
  spec.summary = %q{ Mercado Pago gem. }
  spec.description = %q{ A Ruby interface to the Mercado Pago API. }
  spec.homepage = 'https://github.com/devpolish/mercadopago-ruby'
  spec.license = 'MIT'

  spec.files = %w(LICENSE.txt README.md Rakefile mercadopago-ruby.gemspec)
  spec.files += Dir.glob('lib/**/*.rb')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = Dir.glob('test/**/*')
  spec.require_paths = ['lib']
  spec.required_rubygems_version = '>= 1.3.5'

  spec.add_development_dependency 'bundler',  '~> 1.5'
  spec.add_development_dependency 'rake',     '~> 0'
  spec.add_development_dependency 'rspec',    '~> 3.3.0'

  spec.add_dependency 'faraday', '~> 0.9.0'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'request_id'
  spec.add_dependency 'json'
end
