# Yabeda::Hanami

Built-in metrics for out of the box [Hanami](https://hanamirb.org/) applications monitoring.

[![Gem Version](https://badge.fury.io/rb/yabeda-hanami.svg)](https://badge.fury.io/rb/yabeda-hanami)

## Metrics

### Rack
| type      | name                        | subscription[^1]      | comment                                                            |
|-----------|-----------------------------|-----------------------|--------------------------------------------------------------------|
| counter   | :hanami_requests_total      | :"rack.request.start" | Total web requests received (by method, path, remote_ip)           |
| counter   | :hanami_responses_total     | :"rack.request.stop"  | Total web responses given (by method, path, remote_ip, status)     |
| histogram | :hanami_processing_duration | :"rack.request.stop"  | Processing duration in seconds (by method, path, remote_ip, status) |
| counter   | :hanami_errors_total        | :"rack.request.error" | Total rack errors (by method, path, remote_ip)[^2]                 |
[^1]: `id` of [Dry::Monitor::Notifications](https://www.rubydoc.info/gems/dry-monitor/Dry/Monitor/Notifications) declared in [Dry::Monitor::Rack::Middleware](https://www.rubydoc.info/gems/dry-monitor/Dry/Monitor/Rack/Middleware)
[^2]: I don't think this event is ever used! [dry-monitor (1.0.1)](https://www.rubydoc.info/gems/dry-monitor)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "yabeda-hanami"
# Then add monitoring system adapter, e.g.:
# gem 'yabeda-prometheus'
```

Alternatively, install from git:
```ruby
gem "yabeda-hanami", git: "https://github.com/mlibrary/yabeda-hanami.git", branch: "main"
```
And then execute:

```shell
bundle
```
## Usage

Registering metrics on server process start

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Docker Compose Development Environment (dcde)

After checking out the repo, run `docker-compose build` to build the **dcde** image. Once the image is built, run `docker-compose up -d` which will create the **dcde** container. Now run `docker-compose exec -- dcde bash` to get a bash shell inside the container.

From here on it is the same as above a.k.a. run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. etc...

**NOTE:** If you are using `docker-compose` on a non-linux machine you will need to run `bundle lock --add-platform x86_64-linux` otherwise the action workflows will fail when pushing your branch to GitHub.  

## Releasing

1. Bump version number in `lib/yabeda/hanami/version.rb` 

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

Bug reports and pull requests are welcome on GitHub at https://github.com/mlibrary/yabeda-hanami. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mlibrary/yabeda-hanami/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the Yabeda::Hanami project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mlibrary/yabeda-hanami/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [Apache 2.0 License](https://opensource.org/license/apache-2-0).

## Copyright Notice
Copyright 2024, Regents of the University of Michigan.
