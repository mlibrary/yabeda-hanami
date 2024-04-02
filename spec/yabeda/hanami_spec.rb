# frozen_string_literal: true

def app
  TestApplication
end

RSpec.describe Yabeda::Hanami do
  it "has a version number" do
    expect(described_class::VERSION).not_to be nil
  end

  it "has a config" do
    expect(described_class.config).not_to be nil
  end

  describe "#install!" do
    it "installs correctly" do
      expect { described_class.install! }.not_to raise_error
    end
  end

  describe "#subscribe!" do
    let(:notifications) { double("notifications") }

    before do
      described_class.install!
      allow(Yabeda::Hanami.config).to receive(:notifications).and_return(notifications)
      allow(notifications).to receive(:subscribe).with(:"rack.request.start")
      allow(notifications).to receive(:subscribe).with(:"rack.request.stop")
      allow(notifications).to receive(:subscribe).with(:"rack.request.error")
    end

    it "initializes correctly" do
      expect { described_class.subscribe! }.not_to raise_error
      expect(notifications).to have_received(:subscribe).with(:"rack.request.start").once
      expect(notifications).to have_received(:subscribe).with(:"rack.request.stop").once
      expect(notifications).to have_received(:subscribe).with(:"rack.request.error").once
    end
  end
end
