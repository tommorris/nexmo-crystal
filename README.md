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

```crystal
require "nexmo"
```

TODO: Write usage instructions here


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

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/tommorris/nexmo-crystal/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [@tommorris](https://github.com/tommorris) Tom Morris - creator, maintainer
