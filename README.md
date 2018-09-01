# nexmo-crystal

An attempt towards a wrapper library for
[Nexmo APIs](https://developer.nexmo.com/) written in
[Crystal](https://crystal-lang.org/).

The library aims towards correctness rather than comprehensiveness. Correctness
in this sense is about using the compiler to as many poorly formed requests
as we can, then testing for well-formed requests at runtime.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  nexmo:
    github: tommorris/nexmo-crystal
```

## Usage

To send an SMS:

```crystal
require "nexmo"

client = Nexmo::Client.new(api_key: "abc1234", api_secret: "def987654")
client.send_sms(from: "AcmeInc", to: "44700900000", message: "Hello World")
```


## API coverage

* Account
    * [ ] Balance
    * [ ] Pricing
    * [ ] Settings
    * [ ] Top Up
    * [ ] Numbers
        * [ ] Search
        * [ ] Buy
        * [ ] Cancel
        * [ ] Update
* Number Insight
    * [ ] Basic
    * [ ] Standard
    * [ ] Advanced
    * [ ] Webhook Notification
* Verify
    * [ ] Verify
    * [ ] Check
    * [ ] Search
    * [ ] Control
* Messaging
    * [X] Send
    * [ ] Delivery Receipt
    * [ ] Inbound Messages
    * [ ] Search
        * [ ] Message
        * [ ] Messages
        * [ ] Rejections
    * [ ] US Short Codes
        * [ ] Two-Factor Authentication
        * [ ] Event Based Alerts
            * [ ] Sending Alerts
            * [ ] Campaign Subscription Management
* Voice
    * [ ] Outbound Calls
    * [ ] Inbound Call
    * [ ] Text-To-Speech Call
    * [ ] Text-To-Speech Prompt

## Development

1. Write tests for stuff and put it in specs.
2. Use a named, defaulted argument for faking API calls rather than mocks and
   stubs and so on.
3. Follow the Crystal style guide.
4. Don't check in binaries or `dwarf` files.

## Contributing

1. Fork it ( https://github.com/tommorris/nexmo-crystal/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [@tommorris](https://github.com/tommorris) Tom Morris - creator, maintainer
