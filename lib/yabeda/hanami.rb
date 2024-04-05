# frozen_string_literal: true

require "yabeda"
require "yabeda/hanami/config"
require "yabeda/hanami/event"
require "yabeda/hanami/version"

module Yabeda
  module Hanami
    class Error < StandardError; end

    LONG_RUNNING_REQUEST_BUCKETS = [
      0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1, 2.5, 5, 10, # standard
      30, 60, 120, 300, 600 # Sometimes requests may be really long-running
    ].freeze

    class << self
      # Declare and install metrics
      def install!
        Yabeda.configure do
          _yabeda_hanami_config = ::Yabeda::Hanami.config

          group :hanami do
            counter :requests_total,
              comment: "A counter of the total number of HTTP requests hanami processed.",
              tags: %i[method path remote_ip]

            counter :responses_total,
              comment: "A counter of the total number of HTTP requests hanami processed.",
              tags: %i[method path remote_ip status]

            histogram :processing_duration,
              unit: :seconds,
              buckets: LONG_RUNNING_REQUEST_BUCKETS,
              comment: "A histogram of the processing duration.",
              tags: %i[method path remote_ip status]

            counter :rack_errors_total,
              comment: "A counter of the total number of rack errors.",
              tags: %i[method path remote_ip status]
          end
        end
      end

      # Subscribe to events
      def subscribe!
        yabeda_hanami_config = ::Yabeda::Hanami.config

        yabeda_hanami_config.notifications.subscribe(:"rack.request.start") do |event|
          event = Yabeda::Hanami::Event.new(event.id, event.payload)

          Yabeda.hanami_requests_total.increment(event.labels)
        end

        yabeda_hanami_config.notifications.subscribe(:"rack.request.stop") do |event|
          event = Yabeda::Hanami::Event.new(event.id, event.payload)

          Yabeda.hanami_responses_total.increment(event.labels)
          Yabeda.hanami_processing_duration.measure(event.labels, event.duration)
        end

        yabeda_hanami_config.notifications.subscribe(:"rack.request.error") do |event|
          event = Yabeda::Hanami::Event.new(event.id, event.payload)

          Yabeda.hanami_rack_errors_total.increment(event.labels)
        end
      end

      def config
        @config ||= Config.new
      end
    end
  end
end
