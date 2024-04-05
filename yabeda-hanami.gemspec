# -*- encoding: utf-8 -*-
# stub: yabeda-hanami 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "yabeda-hanami".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/mlibrary/yabeda-hanami/blob/main/CHANGELOG.md", "homepage_uri" => "https://github.com/mlibrary/yabeda-hanami", "source_code_uri" => "https://github.com/mlibrary/yabeda-hanami" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Greg Kostin".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-04-05"
  s.description = "Easy collecting your Hanami apps metrics".freeze
  s.email = ["gkostin@umich.edu".freeze]
  s.files = ["lib/yabeda/hanami.rb".freeze,
             "lib/yabeda/hanami/config.rb".freeze,
             "lib/yabeda/hanami/event.rb".freeze,
             "lib/yabeda/hanami/version.rb".freeze]
  s.homepage = "https://github.com/mlibrary/yabeda-hanami".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.4.19".freeze
  s.summary = "Extensible metrics for monitoring a Hanami application".freeze

  s.installed_by_version = "3.4.19" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<hanami>.freeze, ["~> 2.1"])
  s.add_runtime_dependency(%q<yabeda>.freeze, ["~> 0.12"])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
  s.add_development_dependency(%q<debug>.freeze, ["~> 1.9"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  s.add_development_dependency(%q<standard>.freeze, ["~> 1.3"])
end
