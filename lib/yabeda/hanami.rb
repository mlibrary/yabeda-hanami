# frozen_string_literal: true

require "yabeda"

require "yabeda/hanami/config"
require "yabeda/hanami/version"

module Yabeda
  module Hanami
    class Error < StandardError; end

    LONG_RUNNING_REQUEST_BUCKETS = [
      0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1, 2.5, 5, 10, # standard
      30, 60, 120, 300, 600 # Sometimes requests may be really long-running
    ].freeze

    class << self
      def controller_handlers
        @controller_handlers ||= []
      end

      def on_controller_action(&block)
        controller_handlers << block
      end

      # Declare metrics and install event handlers for collecting themya
      def install!
        Yabeda.configure do
          yabeda_hanami_config = ::Yabeda::Hanami.config

          group :hanami

          counter :requests_total, comment: "A counter of the total number of HTTP requests hanami processed.",
            tags: %i[controller action status format method]

          histogram :request_duration, tags: %i[controller action status format method],
            unit: :seconds,
            buckets: LONG_RUNNING_REQUEST_BUCKETS,
            comment: "A histogram of the response latency."

          histogram :view_runtime, unit: :seconds, buckets: LONG_RUNNING_REQUEST_BUCKETS,
            comment: "A histogram of the view rendering time.",
            tags: %i[controller action status format method]

          histogram :db_runtime, unit: :seconds, buckets: LONG_RUNNING_REQUEST_BUCKETS,
            comment: "A histogram of the persistance execution time.",
            tags: %i[controller action status format method]

          if yabeda_hanami_config.apdex_target
            gauge :apdex_target, unit: :seconds,
              comment: "Tolerable time for Apdex (T value: maximum duration of satisfactory request)"
            collect { hanami_apdex_target.set({}, yabeda_hanami_config.apdex_target) }
          end

          # Dry::Monitor::Notifications.subscribe "process_action.action_controller" do |*args|
          #   event = Yabeda::Hanami::Event.new(*args)
          #
          #   hanami_requests_total.increment(event.labels)
          #   hanami_request_duration.measure(event.labels, event.duration)
          #   hanami_view_runtime.measure(event.labels, event.view_runtime)
          #   hanami_db_runtime.measure(event.labels, event.db_runtime)
          #
          #   Yabeda::Hanami.controller_handlers.each do |handler|
          #     handler.call(event, event.labels)
          #   end
          # end
        end
      end

      def config
        @config ||= Config.new
      end
    end
  end
end
