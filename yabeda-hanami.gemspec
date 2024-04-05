# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "yabeda-hanami"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = {"changelog_uri" => "https://github.com/mlibrary/yabeda-hanami/blob/main/CHANGELOG.md", "homepage_uri" => "https://github.com/mlibrary/yabeda-hanami", "source_code_uri" => "https://github.com/mlibrary/yabeda-hanami"} if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["Greg Kostin"]
  s.bindir = "exe"
  s.description = "Easy collecting your Hanami apps metrics"
  s.email = ["gkostin@umich.edu"]
  s.files = [".my_frozen_string_literal_comment.yml", ".rspec", ".standard.yml", "CHANGELOG.md", "CODE_OF_CONDUCT.md", "Dockerfile", "LICENSE.txt", "README.md", "Rakefile", "docker-compose.yml", "hanami_app/.bundle/config", "hanami_app/.gitignore", "hanami_app/.my_frozen_string_literal_comment.yml", "hanami_app/.rspec", "hanami_app/.standard.yml", "hanami_app/Gemfile", "hanami_app/Gemfile.lock", "hanami_app/Guardfile", "hanami_app/Procfile.dev", "hanami_app/README.md", "hanami_app/Rakefile", "hanami_app/app/action.rb", "hanami_app/app/actions/.keep", "hanami_app/app/actions/hello/error.rb", "hanami_app/app/actions/hello/world.rb", "hanami_app/app/assets/css/app.css", "hanami_app/app/assets/images/favicon.ico", "hanami_app/app/assets/js/app.js", "hanami_app/app/templates/layouts/app.html.erb", "hanami_app/app/view.rb", "hanami_app/app/views/helpers.rb", "hanami_app/bin/dev", "hanami_app/config.ru", "hanami_app/config/app.rb", "hanami_app/config/assets.js", "hanami_app/config/providers/monitor.rb", "hanami_app/config/puma.rb", "hanami_app/config/routes.rb", "hanami_app/config/settings.rb", "hanami_app/lib/hanami_app/types.rb", "hanami_app/lib/rubocop/cop/style/my_frozen_string_literal_comment.rb", "hanami_app/lib/tasks/.keep", "hanami_app/package-lock.json", "hanami_app/package.json", "hanami_app/public/404.html", "hanami_app/public/500.html", "hanami_app/spec/requests/metrics_spec.rb", "hanami_app/spec/spec_helper.rb", "hanami_app/spec/support/features.rb", "hanami_app/spec/support/requests.rb", "hanami_app/spec/support/rspec.rb", "lib/rubocop/cop/style/my_frozen_string_literal_comment.rb", "lib/yabeda/hanami.rb", "lib/yabeda/hanami/config.rb", "lib/yabeda/hanami/event.rb", "lib/yabeda/hanami/version.rb", "public/404.html", "public/500.html", "sig/rubocop/cop/style/my_frozen_string_literal_comment.rbs", "sig/yabeda/hanami.rbs"]
  s.homepage = "https://github.com/mlibrary/yabeda-hanami"
  s.licenses = ["Apache-2.0"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0") if s.respond_to? :required_ruby_version=
  s.summary = "Extensible metrics for monitoring a Hanami application"

  s.add_runtime_dependency("hanami", ["~> 2.1"])
  s.add_runtime_dependency("yabeda", ["~> 0.12"])
  s.add_development_dependency("bundler", ["~> 2.0"])
  s.add_development_dependency("debug", ["~> 1.9"])
  s.add_development_dependency("rake", ["~> 13.0"])
  s.add_development_dependency("rspec", ["~> 3.0"])
  s.add_development_dependency("standard", ["~> 1.3"])
end
