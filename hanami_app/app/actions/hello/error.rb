# frozen_string_literal: true

# require "yabeda/hanami"

module HanamiApp
  module Actions
    module Hello
      class Error < HanamiApp::Action
        def handle(request, response)
          Yabeda.hanami.request_errors_total.increment({method: "GET", scheme: "http", path: "/hello/error", status: 500}, by: 1)
          response.status = 500
        end
      end
    end
  end
end
