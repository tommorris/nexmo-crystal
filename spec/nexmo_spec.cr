require "./spec_helper"

describe Nexmo do
  it "allows you to initalise a client with either an application or API key" do
    a = Nexmo::Client.new(api_key: "abc1234", api_secret: "xxyyzz567890")
    a.api_key.should eq("abc1234")
  end

  it "allows you to (fake) send a text message" do
    a = Nexmo::Client.new(api_key: "abc1234", api_secret: "xxyyzz567890")
    res = a.send_sms(from: "AcmeInc", to: "447700900000", message: "Hello", fake: true)
    res.should be_falsey
  end

  it "should throw an error if you specify a ttl that's out of bounds" do
    expect_raises(Exception, /ttl must be/) do
      a = Nexmo::Client.new(api_key: "abc1234", api_secret: "xxyyzz567890")
      a.send_sms(from: "AcmeInc", to: "447700900000", message: "Hello World", ttl: 5)
    end
  end

  it "should throw an error if you specify a type that's not valid" do
    expect_raises(Exception, /type parameter/) do
      a = Nexmo::Client.new(api_key: "abc1234", api_secret: "xxyyzz567890")
      a.send_sms(from: "AcmeInc", to: "447700900000", message: "Hello World", type: "fake")
    end
  end

  it "should validate real URLs from fake ones for callbacks" do
    expect_raises(Exception, /callback URI/) do
      a = Nexmo::Client.new(api_key: "abc1234", api_secret: "xxyyzz567890")
      a.send_sms(from: "AcmeInc", to: "447700900000", message: "Hello World", callback: "about:blank")
    end
  end
end
