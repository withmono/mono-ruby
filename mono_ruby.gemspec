# frozen_string_literal: true

require_relative "lib/mono_ruby/version"

Gem::Specification.new do |spec|
  spec.name          = "mono_ruby"
  spec.version       = MonoRuby::VERSION
  spec.authors       = ["kkenway"]
  spec.email         = ["king@mono.co"]

  spec.summary       = "Ruby API for Mono"
  spec.description   = "Ruby gem wrapper for the Mono API. Read more here at https://docs.mono.co/docs"
  spec.homepage      = "https://mono.co/"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/withmono/mono-ruby"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_dependency "httparty", "~> 0.18.1"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
