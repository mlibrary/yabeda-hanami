# frozen_string_literal: true

require_relative "lib/yabeda/hanami/version"

Gem::Specification.new do |spec|
  spec.name = "yabeda-hanami"
  spec.version = Yabeda::Hanami::VERSION
  spec.authors = ["Greg Kostin"]
  spec.email = ["gkostin@umich.edu"]

  spec.summary = "Extensible metrics for monitoring a Hanami application"
  spec.description = "Easy collecting your Hanami apps metrics"
  spec.homepage = "https://github.com/gkostin1966/yabeda-hanami"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "https://example.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/gkostin1966/yabeda-hanami"
  spec.metadata["changelog_uri"] = "https://github.com/gkostin1966/yabeda-hanami/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "yabeda", "~> 0.12"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "standard", "~> 1.3"
  spec.add_development_dependency "debug", "~> 1.9"

  HANAMI_VERSION = "2.0"
  spec.add_development_dependency "hanami", "~> #{HANAMI_VERSION}"
  spec.add_development_dependency "hanami-router", "~> #{HANAMI_VERSION}"
  spec.add_development_dependency "hanami-controller", "~> #{HANAMI_VERSION}"
  
  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
