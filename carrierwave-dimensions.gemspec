# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carrierwave/dimensions/version'

Gem::Specification.new do |spec|
  spec.name          = "carrierwave-dimensions"
  spec.version       = CarrierWave::Dimensions::VERSION
  spec.authors       = ["Alexander Tipugin"]
  spec.email         = ["atipugin@gmail.com"]

  spec.summary       = %q{Allows you to check image dimensions in your CarrierWave uploaders.}
  spec.homepage      = "https://github.com/atipugin/carrierwave-dimensions"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.3.0'
  spec.add_development_dependency 'rubocop', '~> 0.34.2'

  spec.add_dependency 'activesupport', '>= 3.2'
  spec.add_dependency 'fastimage'
  spec.add_dependency 'carrierwave'
end
