# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'server_spec_demo/version'

Gem::Specification.new do |spec|
  spec.name          = "server_spec_demo"
  spec.version       = ServerSpecDemo::VERSION
  spec.authors       = ['Andrew Wardrobe']
  spec.email         = ['andrew.g.wardrobe@googlemail.com']

  spec.summary       = %q{Demoing Serverspec}
  spec.description   = %q{Serverspec Demo}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.6"
  spec.add_development_dependency "docker-api"
  spec.add_development_dependency "serverspec"
  spec.add_development_dependency "serverspec_launcher", '0.1.5'
  spec.add_development_dependency "rspec_junit_formatter"
end
