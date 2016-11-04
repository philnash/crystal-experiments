require "kemal"

post "/voice" do |context|
  context.response.content_type = "text/xml"
  "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
  <Response>
    <Say>Hello from Kemal and Crystal!</Say>
  </Response>"
end

Kemal.run