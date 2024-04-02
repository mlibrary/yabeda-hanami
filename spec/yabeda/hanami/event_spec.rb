# frozen_string_literal: true

require "yabeda/hanami/event"

RSpec.describe Yabeda::Hanami::Event do
  let(:event) { described_class.new(id, payload) }
  let(:id) { "1" }
  let(:payload) { {env: {"REQUEST_METHOD" => "GET", "PATH_INFO" => "hello/world", "rack.url_scheme" => "http"}, status: 200, time: 1000} }

  describe "#labels" do
    it "returns labels" do
      expect(event.labels).to eq({method: "GET", path: "hello/world", scheme: "http", status: 200})
    end
  end

  describe "#duration" do
    it "returns duration in seconds" do
      expect(event.duration).to eq(1)
    end
  end
end
