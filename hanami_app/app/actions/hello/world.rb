# frozen_string_literal: true

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
