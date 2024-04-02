# frozen_string_literal: true

require "yabeda/hanami"

Hanami.app.register_provider :monitor, namespace: true do
  prepare do
    # require "rom"
    #
    # opts = {
    #   connect_timeout: 5
    # }
    # config = ROM::Configuration.new(:sql, target["settings"].database_url, opts)
    #
    # config.auto_registration("lauth/repositories", namespace: "Lauth")
    #
    # register "config", config
    # register "db", config.gateways[:default].connection

    config = Yabeda::Hanami.config

    config.inflector = target["inflector"]
    config.routes = target["routes"]
    config.notifications = target["notifications"]
    config.monitor = target["rack.monitor"]
  end

  start do
    # config = target["persistence.config"]
    #
    # config.auto_registration(
    #   target.root.join("lib/lauth/persistence"),
    #   namespace: "Lauth::Persistence"
    # )
    #
    # register "rom", ROM.container(config)

    config = Yabeda::Hanami.config

    config.notifications.register_event("greg.kostin")

    Yabeda::Hanami.initialize!
  end
end
