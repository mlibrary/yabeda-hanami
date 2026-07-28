# frozen_string_literal: true

require "hanami/boot"
require "yabeda/prometheus"

use Yabeda::Prometheus::Exporter

Hanami.app.start :rack
Hanami.app.start :instrument

run Hanami.app
