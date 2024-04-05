# frozen_string_literal: true

require "yabeda/hanami"

Hanami.app.register_provider :instrument, namespace: true do
  prepare do
    Yabeda::Hanami.install!

    config = Yabeda::Hanami.config

    config.notifications = target["notifications"]

    Yabeda.configure!
  end

  start do
    _config = Yabeda::Hanami.config

    Yabeda::Hanami.subscribe!
  end
end
