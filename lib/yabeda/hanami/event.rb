# frozen_string_literal: true

require "dry/events"

module Yabeda
  module Hanami
    # ActiveSupport Event with added logic for Yabeda tags formatting
    class Event < Dry::Events::Event
      def labels
        @labels ||= begin
          labels = {
            controller: controller,
            action: action,
            status: status,
            format: format,
            method: method
          }
          labels.merge(payload.slice(*Yabeda.default_tags.keys - labels.keys))
        end
      end

      def duration
        ms2s payload[:time]
      end

      def view_runtime
        # ms2s payload[:view_runtime]
        0
      end

      def db_runtime
        # ms2s payload[:db_runtime]
        0
      end

      private

      def controller
        case Yabeda::Hanami.config.controller_name_case
        when :camel
          # payload[:controller]
          "CamelCase"
        else
          # payload[:params]["controller"]
          "nonCamelCase"
        end
        # monitor = Yabeda::Hanami.config.monitor
        # action = monitor.hello
        # routes = Yabeda::Hanami.config.routes
        # routes.router.recognize(payload[:env]["PATH_INFO"]).to_s
        # inflector = Yabeda::Hanami.config.inflector
        # inflector.camelize(payload[:env]["PATH_INFO"]).to_s
        Yabeda::Hanami.config.inflector.camelize(payload[:env]["PATH_INFO"].chomp("/").reverse.chomp("/").reverse)
      end

      def action
        # payload[:action]
        payload[:env]["PATH_INFO"].split("/").last
      end

      def status
        # if payload[:status].nil? && payload[:exception].present?
        #   Dry::Notifications::ExceptionWrapper.status_code_for_exception(payload[:exception].first)
        # else
        payload[:status]
        # end
      end

      def format
        payload[:env]["rack.url_scheme"]
      end

      def method
        puts payload
        puts "REQUEST_METHOD: #{payload[:env]["REQUEST_METHOD"]}"
        payload[:env]["REQUEST_METHOD"].to_s.downcase
      end

      def ms2s(milliseconds)
        (milliseconds.to_f / 1000).round(3)
      end
    end
  end
end
