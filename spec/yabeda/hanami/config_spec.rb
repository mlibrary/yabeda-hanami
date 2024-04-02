# frozen_string_literal: true

require "yabeda/hanami/config"

RSpec.describe Yabeda::Hanami.config do
  it "has a config_name" do
    expect(described_class.config_name).to eq(:yabeda_hanami.to_s)
  end

  it "has a notifications" do
    expect(described_class.notifications).to be_nil
  end
end
