# frozen_string_literal: true

require "dry/events"

module Yabeda
  module Hanami
    # Dry::Events::Event with added logic for Yabeda tags formatting
    class Event < ::Dry::Events::Event
      def labels
        @labels ||= begin
          labels = {
            method: method,
            path: path,
            status: status,
            remote_ip: remote_ip
          }
          labels.merge(payload.slice(*Yabeda.default_tags.keys - labels.keys))
        end
      end

      def duration
        ms2s payload[:time]
      end

      private

      def remote_ip
        payload[:env]["REMOTE_ADDR"]
      end

      def method
        payload[:env]["REQUEST_METHOD"]
      end

      def path
        payload[:env]["PATH_INFO"]
      end

      def status
        payload[:status]
      end

      def ms2s(milliseconds)
        (milliseconds.to_f / 1000).round(3)
      end
    end
  end
end
