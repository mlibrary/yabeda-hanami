# frozen_string_literal: true

module HanamiApp
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    root to: "hello.world"

    get "/hello/world", to: "hello.world"
  end
end
