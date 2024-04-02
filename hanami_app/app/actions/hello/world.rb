# frozen_string_literal: true

# require "yabeda/hanami"

module HanamiApp
  module Actions
    module Hello
      class World < HanamiApp::Action
        def handle(request, response)
          response.body = "Hello World!"
        end
      end
    end
  end
end
