require "http/client"
require "json"

class Message
  # We just create a mapping for the attributes we care about right now. This
  # ignores any other attributes.
  JSON.mapping(
    sid: String,
    body: String
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

def send_message(to, from, body)
  # Create an HTTP::Client to use for this request.
  client = HTTP::Client.new("api.twilio.com", 443, true) do |client|
    # Set basic auth header using Twilio Account SID and Auth Token.
    client.basic_auth(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    # Make a POST request to the Messages endpoint. `post_form` will encode the
    # parameters as `application/x-www-form-urlencoded`.
    response = client.post_form("/2010-04-01/Accounts/#{ENV["TWILIO_ACCOUNT_SID"]}/Messages.json", {
      "To"   => to,
      "From" => from,
      "Body" => body,
    })
    if response.success?
      # If the response is a success then we can parse the response body as a
      # Message object.
      message = Message.from_json(response.body)
      puts message.sid, message.body
    else
      # If the result is not a success then we parse the response body as an
      # Error object.
      error = Error.from_json(response.body)
      puts error.status, error.message
    end
  end
end

# Call the function.
send_message(ENV["MY_NUMBER"], ENV["TWILIO_NUMBER"], "Hello from Crystal!")
