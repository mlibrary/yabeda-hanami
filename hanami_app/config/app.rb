# frozen_string_literal: true

require "hanami"
require "yabeda"
require "yabeda/hanami"

module HanamiApp
  class App < Hanami::App
    # prepare_container do |container|
    #   use :monitoring
    # end

    Yabeda::Hanami.install!
    Yabeda.configure!
    raise StandardError unless Yabeda.configured?
    raise StandardError unless Yabeda.hanami

    config.middleware.use Yabeda::Hanami::Middleware
  end
end
