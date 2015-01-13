# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resque/failure_stats/version'

Gem::Specification.new do |spec|
  spec.name          = 'resque-failure_stats'
  spec.version       = Resque::FailureStats::VERSION
  spec.authors       = ['Victor Koronen']
  spec.email         = ['koronen@kth.se']
  spec.summary       = 'Failure stats for Resque'
  spec.description   = 'Failure stats for Resque'
  spec.homepage      = 'https://github.com/Koronen/resque-failure_stats'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'resque', '~> 1.17'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
