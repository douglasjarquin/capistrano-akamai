# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/akamai/version'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-akamai'
  spec.version       = Capistrano::Akamai::VERSION
  spec.authors       = ['Douglas Jarquin']
  spec.email         = ['douglasjarquin@me.com']
  spec.description   = %q{A capistrano plugin to purge or invalidate Akamai's Edge cache}
  spec.summary       = %q{Trigger a callback to invalidate or purge Akamai's Edge cache after deploys}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'akamai_api', '>= 0.0.5'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
