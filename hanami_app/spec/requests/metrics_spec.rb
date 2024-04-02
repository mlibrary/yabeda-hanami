# frozen_string_literal: true

RSpec.describe "Metrics", type: :request do
  it "is OK" do
    # puts "prepared: #{app.prepared?}, booted: #{app.booted?}"
    # puts "keys: #{app.keys}"
    # puts "notifications: #{app["notifications"].__bus__.events.keys}"
    #
    # puts "subscribe"
    # app["notifications"].subscribe("greg.kostin") do |event|
    #   puts "Event Greg: #{event.payload}"
    # end
    #
    # app["notifications"].subscribe(:"rack.request.start") do |event|
    #   puts "Event Start: #{event.payload}"
    # end
    #
    # app["notifications"].subscribe(:"rack.request.stop") do |event|
    #   puts "Event Stop: #{event.payload}"
    # end
    #
    # app["notifications"].subscribe(:"rack.request.error") do |event|
    #   puts "Event Error: #{event.payload}"
    # end
    #
    # puts "instrument"
    # app["notifications"].instrument("greg.kostin", greg: "kostin") do
    #   puts "A"
    #   get "/hello/world"
    # end
    #
    # puts "B"
    get "/hello/world"

    # Generate new action via:
    #   `bundle exec hanami generate action home.index --url=/`
    expect(last_response.status).to be(200)
  end

  it "returns Hello World! in the body" do
    get "/hello/world"

    expect(last_response.body).to eq("Hello World!")
  end

  it "increments counters for every request" do
    expect { get "/hello/world" }.to \
      increment_yabeda_counter(Yabeda.hanami.requests_total)
      .with_tags(controller: "Hello::World", action: "world", status: 200, method: "get", format: "http")
      .by(1)
  end
end
