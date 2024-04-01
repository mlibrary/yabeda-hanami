# frozen_string_literal: true

require "yabeda/hanami"

RSpec.describe Yabeda::Hanami.config do
  it "has a config_name" do
    expect(described_class.config_name).to eq(:yabeda_hanami.to_s)
  end

  it "has a apdex_target attribute" do
    expect { described_class.apdex_target }.not_to raise_error
  end

  it "has a nil default apdex_target" do
    expect(described_class.apdex_target).to be nil
  end
end
