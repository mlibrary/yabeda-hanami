# frozen_string_literal: true

# require "yabeda/hanami"

module HanamiApp
  module Actions
    module Hello
      class Error < HanamiApp::Action
        handle_exception StandardError => 500
        def handle(request, response)
          Yabeda.hanami.rack_errors_total.increment({method: "GET", path: "/hello/error", remote_ip: "127.0.0.1", status: 500}, by: 1)
          response.status = 500
          raise Yabeda::Hanami::Error
        end
      end
    end
  end
end
