# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jp_post/version'

Gem::Specification.new do |spec|
	spec.name          = "jp_post"
	spec.version       = JpPost::VERSION
	spec.authors       = ["Sebastian Szturo"]
	spec.email         = ["s.szturo@me.com"]
	spec.description   = "Gem to access JP Posts Services."
	spec.summary       = "Gem to access JP Posts Services."
	spec.homepage      = "http://github.com/SebastianSzturo/jp_post"
	spec.license       = "MIT"

	spec.files         = `git ls-files`.split($/)
	spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
	spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
	spec.require_paths = ["lib"]

	spec.add_dependency "nokogiri"
	spec.add_dependency "chronic"
	spec.add_development_dependency "bundler"
	spec.add_development_dependency "rspec"
	spec.add_development_dependency "guard-rspec"
end
