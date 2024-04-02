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

  describe "#initialize!" do
    let(:notifications) { double("notifications") }

    before do
      described_class.install!
      allow(Yabeda::Hanami.config).to receive(:notifications).and_return(notifications)
      allow(notifications).to receive(:subscribe).with(:"rack.request.stop")
    end

    it "initializes correctly" do
      expect { described_class.initialize! }.not_to raise_error
    end
  end
end
