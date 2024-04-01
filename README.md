# Yabeda::Hanami

Built-in metrics for out-of-the box [Hanami](https://hanamirb.org/) applications monitoring.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. 



Add this line to your application's Gemfile:

```ruby
gem "UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG"
# Then add monitoring system adapter, e.g.:
# gem 'yabeda-prometheus'
```

Alternatively, install from git:
```ruby
gem "yabeda-hanami", git: "https://github.com/gkostin1966/yabeda-hanami.git", branch: "main"
```
And then execute:

```shell
bundle
```

## Usage

### Registering metrics on server process start

Currently, yabeda-hanami automatically registers Hanami metrics when a server is started via `hanami server`, `puma -C config/puma.rb` or `unicorn -c`. However, other application servers or launching via `rackup` aren't supported at the moment.

A possible workaround is to detect server process and manually activate yabeda-hanami in an initializer:

```ruby
# config/initializers/yabeda.rb

if your_app_server_process? # Your logic here
  Yabeda::Hanami.install!
end
```
You always can add support for your app server to [lib/yabeda/hanami/railtie.rb](https://github.com/gkostin1966/yabeda-hanami/blob/master/lib/yabeda/hanami/railtie.rb). Pull Requests are always welcome!

## Metrics

* Total web requests received: `hanami_requests_total`
* Web request duration: `hanami_request_duration` (in seconds)
* Views rendering duration: `hanami_view_runtime` (in seconds)
* DB request duration: `hanami_db_runtime` (in seconds)

## Hooks

* `on_controller_action`: Allows to collect

```ruby
Yabeda::Hanami.on_controller_action do |event, labels|
  next unless event.payload[:ext_service_runtime]
  time_in_seconds = event.payload[:ext_service_runtime] / 1000.0
  hanami_ext_service_runtime.measure(labels, time_in_seconds)
end
```

## Custom tags

You can add additional tags to the existing metrics by adding custom payload to your controller.

```ruby
# This block is optional but some adapters (like Prometheus) requires that all tags should be declared in advance
Yabeda.configure do
  default_tag :importance, nil
end

class ApplicationController < ActionController::Base
  def append_info_to_payload(payload)
    super
    payload[:importance] = extract_importance(params)
  end
end
```

`append_info_to_payload` is a method from [ActionController::Instrumentation](https://api.rubyonrails.org/classes/ActionController/Instrumentation.html#method-i-append_info_to_payload)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Docker Compose Development Environment (dcde)

After checking out the repo, run `docker-compose build`to build the 'dcde' image. Once the image is built, run `docker-compose up -d` which will create the 'dcde' container. Now run `docker-compose exec -- dcde bash` to get a bash shell inside the container.

From here on it is the same as above a.k.a. run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. etc...

NOTE: If you are using `docker-compose` on a non-linux machine you will need to run `bundle lock --add-platform x86_64-linux` otherwise the action workflow 'Ruby' (a.k.a. continuous integration) will fail when pushing your branch to GitHub.  
### Releasing

1. Bump version number in `lib/yabeda/rails/version.rb` 

   In case of pre-releases keep in mind [rubygems/rubygems#3086](https://github.com/rubygems/rubygems/issues/3086) and check version with command like `Gem::Version.new(Yabeda::Hanami::VERSION).to_s`


2. Fill `CHANGELOG.md` with missing changes, add header with version and date.


3. Make a commit:
```shell
git add lib/yabeda/hanami/version.rb CHANGELOG.md
version=$(ruby -r ./lib/yabeda/hanami/version.rb -e "puts Gem::Version.new(Yabeda::Hanami::VERSION)")
git commit --message="${version}: " --edit
```


4. Create annotated tag:
```shell
git tag v${version} --annotate --message="${version}: " --edit --sign
```


5. Fill version name into subject line and (optionally) some description (list of changes will be taken from changelog and appended automatically)


6. Push it:
```shell
git push --follow-tags
```

7. You're done!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gkostin1966/yabeda-hanami. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/gkostin1966/yabeda-hanami/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Yabeda::Hanami project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/gkostin1966/yabeda-hanami/blob/main/CODE_OF_CONDUCT.md).
