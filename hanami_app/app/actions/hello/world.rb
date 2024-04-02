# frozen_string_literal: true

# require "yabeda/hanami"

module HanamiApp
  module Actions
    module Hello
      class World < HanamiApp::Action
        def handle(request, response)
          # raise StandardError unless Yabeda.hanami
          # Hanami.app.logger.info("Hello World!")
          # puts Hanami.app.preparded?
          # puts Hanami.app.booted?
          # puts Hanami.app.keys
          # Hanami.app[:logger].info(Yabeda.hanami.requests_total.to_s)
          # Yabeda.hanami.requests_total.increment({action: "world", controller: "hello", format: :html, method: "get", status: 200}, by: 1)
          response.body = "Hello World!"
        end
      end
    end
  end
end
