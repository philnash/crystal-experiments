require "http/client"
require "json"

class Call
  # Create a mapping for a call object. We just care that we have a sid this
  # time.
  JSON.mapping(
    sid: String
  )
end

class Error
  # We just create a mapping for the attributes we care about right now. This
  # ignores any other attributes.
  JSON.mapping(
    message: String,
    status: Int32
  )
end

def make_call(to, from, url)
  # Create an HTTP::Client to use for this request.
  client = HTTP::Client.new("api.twilio.com", 443, true) do |client|
    # Set basic auth header using Twilio Account SID and Auth Token.
    client.basic_auth(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    # Make a POST request to the Messages endpoint. `post_form` will encode the
    # parameters as `application/x-www-form-urlencoded`.
    response = client.post_form("/2010-04-01/Accounts/#{ENV["TWILIO_ACCOUNT_SID"]}/Calls.json", {
      "To"   => to,
      "From" => from,
      "Url" => url,
    })
    if response.success?
      # If the response is a success then we can parse the response body as a
      # Message object.
      call = Call.from_json(response.body)
      puts call.sid
    else
      # If the result is not a success then we parse the response body as an
      # Error object.
      error = Error.from_json(response.body)
      puts error.status, error.message
    end
  end
end

make_call(ENV["MY_NUMBER"], ENV["TWILIO_NUMBER"], "https://dl.dropboxusercontent.com/u/2554/crystal-call.xml")
