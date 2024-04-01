# frozen_string_literal: true

ENV["HANAMI_ENV"] = "test"

require "bundler/setup"
require "debug"
require "yabeda/hanami"
require "yabeda/rspec"

require_relative "support/hanami_app"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  Kernel.srand config.seed
  config.order = :random

  config.before(:suite) do
    Yabeda::Hanami.install!
  end
end
