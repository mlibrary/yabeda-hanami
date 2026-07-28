# frozen_string_literal: true

require "pathname"
SPEC_ROOT = Pathname(__dir__).realpath.freeze

ENV["HANAMI_ENV"] ||= "test"
require "hanami/prepare"
require "yabeda"
require "yabeda/rspec"
Hanami.app.start :rack
Hanami.app.start :instrument

SPEC_ROOT.glob("support/**/*.rb").each { |f| require f }
