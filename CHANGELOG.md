## [Unreleased]

- 

## [0.1.1] - 2024-04-05

- Yabeda::Prometheus::Adapter::UndeclaredMetricTags at Prometheus requires all used tags to be declared at metric registration time. Please add `tags` option to the declaration of metric `hanami_requests_total`. Error: labels must have the same signature (keys given: [:method, :path, :status, :remote_ip] vs. keys expected: [:method, :path, :remote_ip]

## [0.1.0] - 2024-04-05

- Initial release
