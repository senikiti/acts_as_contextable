# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acts_as_contextable/version'

Gem::Specification.new do |spec|
  spec.name          = "acts_as_contextable"
  spec.version       = ActsAsContextable::VERSION
  spec.authors       = ["Sergiy Nikitin"]
  spec.email         = ["sn@inno-w.com"]
  spec.description   = %q{This gem provides basic linking functionality of active record objects. In cases when hard-coded references are not needed, you may refer to other objects by adding them to context}
  spec.summary       = %q{Context linking is a flexible mechanizm for dynamic referencing between active record objects.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
