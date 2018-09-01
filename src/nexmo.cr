require "./nexmo/*"
require "crest"

# TODO: Write documentation for `Nexmo`
module Nexmo
  ALLOWED_SMS_OPTIONAL_FIELDS = [
    :ttl, :type
  ]
  ALLOWED_SMS_TYPES = [
    :text, :binary, :wappush, :vcal, :vcard
  ]

  class Client
    def initialize(api_key : String? = nil,
      api_secret : String? = nil,
      #signing_secret : String? = nil
    )
      @api_key = api_key
      @api_secret = api_secret
      #@signing_secret = signing_secret
    end

    def api_key
      @api_key
    end

    def api_secret
      @api_secret
    end

    def send_sms(message : String,
        from : String,
        to : String,
        fake : Bool? = false,
        **opts
    )
      validate_sms_creds()
      data = validate_sms_data(message, from, to, **opts)

      unless fake == true
        resp = Crest.post(
          "https://rest.nexmo.com/sms/json",
          form: data
        )
        return resp
      end
    end

    private def validate_sms_data(message : String,
        from : String,
        to : String,
        **opts)

      data = {} of Symbol => String | Int32 | Nil
      data[:api_key] = @api_key.as(String)
      data[:api_secret] = @api_secret.as(String)
      data[:from] = from
      data[:to] = to
      data[:text] = message

      opts.each do |k, v|
        if ALLOWED_SMS_OPTIONAL_FIELDS.includes?(k) || k == :fake
          data[k] = v
        else
          raise k.to_s + " is not a valid parameter"
        end
      end

      # now we check constraints

      if data.has_key?(:ttl)
        if data[:ttl].as(Int32) < 20000 || data[:ttl].as(Int32) > 604800000
          raise "ttl must be between 20,000 and 604,800,000 seconds"
        end
      end

      if data.has_key?(:type)
        unless ALLOWED_SMS_OPTIONAL_FIELDS.includes? data[:type]
          raise "type parameter has a non-allowed value"
        end
      end

      #puts data
      return data
    end

    private def validate_sms_creds
      if @api_key.nil?
        raise "You need to provide an API key to use the SMS API."
      end
      if @api_secret.nil?
        raise "You need to provide an API secret."
      end
    end
  end
end
