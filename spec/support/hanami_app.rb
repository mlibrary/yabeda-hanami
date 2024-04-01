# frozen_string_literal: true

require "hanami"
# require "action_controller/railtie"
# require "active_support/railtie"

module Support
  class TestApplication < Hanami::App
    # config.logger = Logger.new($stdout)
    # config.log_level = :fatal
    # config.consider_all_requests_local = true
    # config.eager_load = true
    #
    # routes.append do
    #   get "/hello/world" => "hello#world"
    #   get "/hello/long" => "hello#long"
    #   get "/hello/internal_server_error" => "hello#internal_server_error"
    # end
  end

  class Routes < Hanami::Routes
    get "/hello/world", to: "hello.world"
    get "/hello/long", to: "hello.long"
    get "/hello/internal_server_error", to: "hello.internal_server_error"
  end

  module Hello
    class World < Hanami::Action
      def handle(request, response)
        response.render json: { hello: :world }
      end
    end

    # def long
    #   sleep(0.01)
    #   render json: { good: :morning }
    # end

    # def internal_server_error
    #   raise StandardError
    # end
  end

# class HelloController < ActionController::API
#   def world
#     render json: { hello: :world }
#   end
#
#   def long
#     sleep(0.01)
#     render json: { good: :morning }
#   end
#
#   def internal_server_error
#     raise StandardError
#   end
# end

# TestApplication.initialize!
end
