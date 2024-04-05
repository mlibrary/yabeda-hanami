# frozen_string_literal: true

require_relative "lib/yabeda/hanami/version"

Gem::Specification.new do |spec|
  spec.name = "yabeda-hanami"
  spec.version = Yabeda::Hanami::VERSION
  spec.authors = ["Greg Kostin"]
  spec.email = ["gkostin@umich.edu"]

  spec.summary = "Extensible metrics for monitoring a Hanami application"
  spec.description = "Easy collecting your Hanami apps metrics"
  spec.homepage = "https://github.com/mlibrary/yabeda-hanami"
  spec.license = "Apache-2.0"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mlibrary/yabeda-hanami"
  spec.metadata["changelog_uri"] = "https://github.com/mlibrary/yabeda-hanami/blob/main/CHANGELOG.md"

  spec.files = Dir.glob("lib/**/*")
  spec.require_paths = ["lib"]
  spec.extra_rdoc_files = ["CHANGELOG.md", "README.md", "LICENSE.txt"]

  spec.add_dependency "hanami", "~> 2.1"
  spec.add_dependency "yabeda", "~> 0.12"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "debug", "~> 1.9"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "standard", "~> 1.3"
end
