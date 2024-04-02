# frozen_string_literal: true

require "hanami"
require "yabeda"
require "yabeda/hanami"

module HanamiApp
  class App < Hanami::App
    Yabeda::Hanami.install!
    Yabeda.configure!
    raise StandardError unless Yabeda.configured?
    raise StandardError unless Yabeda.hanami
  end
end
