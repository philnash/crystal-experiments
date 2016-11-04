require "http/server"

server = HTTP::Server.new(3000) do |context|
  context.response.content_type = "text/xml"
  context.response.print "<Response><Say>Hello from Crystal!</Say></Response>"
end

puts "Listening on http://0.0.0.0:3000"
server.listen
