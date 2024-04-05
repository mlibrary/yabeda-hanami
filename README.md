# Yabeda::Hanami

Built-in metrics for out of the box [Hanami](https://hanamirb.org/) applications monitoring.

[![Gem Version](https://badge.fury.io/rb/yabeda-hanami.svg)](https://badge.fury.io/rb/yabeda-hanami)

## Metrics

### Rack
| type      | name                        | subscription[^1]      | comment                        |
|-----------|-----------------------------|-----------------------|--------------------------------|
| counter   | :hanami_requests_total      | :"rack.request.start" | Total web requests received    |
| counter   | :hanami_responses_total     | :"rack.request.stop"  | Total web responses given      |
| histogram | :hanami_processing_duration | :"rack.request.stop"  | Processing duration in seconds |
| counter   | :hanami_errors_total        | :"rack.request.error" | Total rack errors[^2]          |
[^1]: `id` of [Dry::Monitor::Notifications](https://www.rubydoc.info/gems/dry-monitor/Dry/Monitor/Notifications) declared in [Dry::Monitor::Rack::Middleware](https://www.rubydoc.info/gems/dry-monitor/Dry/Monitor/Rack/Middleware)
[^2]: I don't think this event is ever used! [dry-monitor (1.0.1)](https://www.rubydoc.info/gems/dry-monitor)

## Installation

### Gemfile
Add these lines to your application's Gemfile:

```ruby
gem "yabeda-hanami", "~> 0.1"
# Then add monitoring system adapter, e.g.:
gem 'yabeda-prometheus'
```

Alternatively, install from git:
```ruby
gem "yabeda-hanami", "~> 0.1", git: "https://github.com/mlibrary/yabeda-hanami.git", tag: "v0.1.1"
# Then add monitoring system adapter, e.g.:
gem 'yabeda-prometheus'
```

### config.ru
Add these lines to your application's config.ru:

```ruby
require "yabeda/prometheus"

# Use the monitoring system adapter, e.g.:
use Yabeda::Prometheus::Exporter #, path: "/metrics"
```

### config/providers/instrument.rb
Create an instrument provider for the application

```ruby
# frozen_string_literal: true

require "yabeda/hanami"

Hanami.app.register_provider :instrument, namespace: true do
  prepare do
    Yabeda::Hanami.install!

    config = Yabeda::Hanami.config

    config.notifications = target["notifications"]

    Yabeda.configure!
  end

  start do
    _config = Yabeda::Hanami.config

    Yabeda::Hanami.subscribe!
  end
end
```

## Verification

In the above example the route `http://127.0.0.1:2300/metrics` returns the application's metrics.

```shell
# TYPE hanami_requests_total counter
# HELP hanami_requests_total A counter of the total number of HTTP requests hanami processed.
hanami_requests_total{method="GET",path="/",status="",remote_ip="172.24.0.1"} 2.0
# TYPE hanami_responses_total counter
# HELP hanami_responses_total A counter of the total number of HTTP requests hanami processed.
hanami_responses_total{method="GET",path="/",status="200",remote_ip="172.24.0.1"} 2.0
# TYPE hanami_processing_duration_seconds histogram
# HELP hanami_processing_duration_seconds A histogram of the processing duration.
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="0.005"} 0.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="0.01"} 0.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="0.025"} 0.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="0.05"} 0.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="0.1"} 1.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="0.25"} 2.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="0.5"} 2.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="1"} 2.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="2.5"} 2.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="5"} 2.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="10"} 2.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="30"} 2.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="60"} 2.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="120"} 2.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="300"} 2.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="600"} 2.0
hanami_processing_duration_seconds_bucket{method="GET",path="/",status="200",remote_ip="172.24.0.1",le="+Inf"} 2.0
hanami_processing_duration_seconds_sum{method="GET",path="/",status="200",remote_ip="172.24.0.1"} 0.246
hanami_processing_duration_seconds_count{method="GET",path="/",status="200",remote_ip="172.24.0.1"} 2.0
# TYPE hanami_rack_errors_total counter
# HELP hanami_rack_errors_total A counter of the total number of rack errors.
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.



To install this gem onto your local machine, run `bundle exec rake install`. 

## Docker Compose Development Environment (dcde)

After checking out the repo, run `docker-compose build` to build the **dcde** image. Once the image is built, run `docker-compose up -d` which will create the **dcde** container. Now run `docker-compose exec -- dcde bash` to get a bash shell inside the container.

From here on it is the same as above a.k.a. run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. etc...

**NOTE:** If you are using `docker-compose` on a non-linux machine you will need to run `bundle lock --add-platform x86_64-linux` otherwise the action workflows will fail when pushing your branch to GitHub.  

## Releasing

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

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
