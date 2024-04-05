# frozen_string_literal: true

RSpec.describe "Metrics", type: :request do
  it "is OK" do
    get "/hello/world"

    expect(last_response.status).to be(200)
  end

  it "returns Hello World! in the body" do
    get "/hello/world"

    expect(last_response.body).to eq("Hello World!")
  end

  it "increments counters for every request" do
    expect { get "/hello/world" }.to \
      increment_yabeda_counter(Yabeda.hanami.requests_total)
      .with_tags(method: "GET", path: "/hello/world", remote_ip: "127.0.0.1", status: nil)
      .by(1)
  end

  it "increments counters for every response" do
    expect { get "/hello/world" }.to \
      increment_yabeda_counter(Yabeda.hanami.responses_total)
      .with_tags(method: "GET", path: "/hello/world", remote_ip: "127.0.0.1", status: 200)
      .by(1)
  end

  it "measures processing duration for every request-response" do
    expect { get "/hello/world" }.to \
      measure_yabeda_histogram(Yabeda.hanami.processing_duration)
      .with(be_between(0, Yabeda::Hanami::LONG_RUNNING_REQUEST_BUCKETS.last))
  end

  it "increments counters for every rack error" do
    expect { get "/hello/error" }.to \
      increment_yabeda_counter(Yabeda.hanami.rack_errors_total)
      .by(1)
  end
end
