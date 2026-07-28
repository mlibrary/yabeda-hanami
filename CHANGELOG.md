## [Unreleased]

- 

## [0.2.0] - 2026-07-27

- Hanami 3.0 has been released, so we release a fresh version that supports it. The minimum supported Ruby version for Hanami 3 is 3.3, so we follow along here. The Yabeda dependency is left at 0.12, but you should use the newest available (currently 0.16).

## [0.1.1] - 2024-04-05

- Yabeda::Prometheus::Adapter::UndeclaredMetricTags at Prometheus requires all used tags to be declared at metric registration time. Please add `tags` option to the declaration of metric `hanami_requests_total`. Error: labels must have the same signature (keys given: [:method, :path, :status, :remote_ip] vs. keys expected: [:method, :path, :remote_ip]

## [0.1.0] - 2024-04-05

- Initial release
