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
  s.files = [".my_frozen_string_literal_comment.yml".freeze, ".rspec".freeze, ".standard.yml".freeze, "CHANGELOG.md".freeze, "CODE_OF_CONDUCT.md".freeze, "Dockerfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "docker-compose.yml".freeze, "hanami_app/.bundle/config".freeze, "hanami_app/.gitignore".freeze, "hanami_app/.my_frozen_string_literal_comment.yml".freeze, "hanami_app/.rspec".freeze, "hanami_app/.standard.yml".freeze, "hanami_app/Gemfile".freeze, "hanami_app/Gemfile.lock".freeze, "hanami_app/Guardfile".freeze, "hanami_app/Procfile.dev".freeze, "hanami_app/README.md".freeze, "hanami_app/Rakefile".freeze, "hanami_app/app/action.rb".freeze, "hanami_app/app/actions/.keep".freeze, "hanami_app/app/actions/hello/error.rb".freeze, "hanami_app/app/actions/hello/world.rb".freeze, "hanami_app/app/assets/css/app.css".freeze, "hanami_app/app/assets/images/favicon.ico".freeze, "hanami_app/app/assets/js/app.js".freeze, "hanami_app/app/templates/layouts/app.html.erb".freeze, "hanami_app/app/view.rb".freeze, "hanami_app/app/views/helpers.rb".freeze, "hanami_app/bin/dev".freeze, "hanami_app/config.ru".freeze, "hanami_app/config/app.rb".freeze, "hanami_app/config/assets.js".freeze, "hanami_app/config/providers/monitor.rb".freeze, "hanami_app/config/puma.rb".freeze, "hanami_app/config/routes.rb".freeze, "hanami_app/config/settings.rb".freeze, "hanami_app/lib/hanami_app/types.rb".freeze, "hanami_app/lib/rubocop/cop/style/my_frozen_string_literal_comment.rb".freeze, "hanami_app/lib/tasks/.keep".freeze, "hanami_app/package-lock.json".freeze, "hanami_app/package.json".freeze, "hanami_app/public/404.html".freeze, "hanami_app/public/500.html".freeze, "hanami_app/spec/requests/metrics_spec.rb".freeze, "hanami_app/spec/spec_helper.rb".freeze, "hanami_app/spec/support/features.rb".freeze, "hanami_app/spec/support/requests.rb".freeze, "hanami_app/spec/support/rspec.rb".freeze, "lib/rubocop/cop/style/my_frozen_string_literal_comment.rb".freeze, "lib/yabeda/hanami.rb".freeze, "lib/yabeda/hanami/config.rb".freeze, "lib/yabeda/hanami/event.rb".freeze, "lib/yabeda/hanami/version.rb".freeze, "public/404.html".freeze, "public/500.html".freeze, "sig/rubocop/cop/style/my_frozen_string_literal_comment.rbs".freeze, "sig/yabeda/hanami.rbs".freeze]
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
