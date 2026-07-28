# frozen_string_literal: true

module HanamiApp
  class Routes < Hanami::Routes
    # Add your routes here. See https://hanakai.org/learn/hanami/routing/ for details.
    get "/hello/world", to: "hello.world"
    get "/hello/error", to: "hello.error"
  end
end
