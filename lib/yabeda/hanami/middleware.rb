# frozen_string_literal: true

require "dry/events"

module Yabeda
  module Hanami
    class Middleware
      def initialize(app)
        @app = app
      end

      def call(env)
        # puts "Received the incoming request"

        status, headers, body = nil
        # forward the request to the next middleware or app
        ::Hanami.app["notifications"].instrument("greg.kostin", rack: "middleware") do
          status, headers, body = @app.call(env)
          sleep(1)
        end

        # puts "Received the outgoing response"

        [status, headers, body]
      end
    end
  end
end
