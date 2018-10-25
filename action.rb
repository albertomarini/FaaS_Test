# Import Sinatra
require 'sinatra'
# Import Sinatra's JSON package needed for neat JSON responses.
require 'sinatra/json'

# setup port, ip address and environment
set :port, 8080
set :bind, '0.0.0.0'
set :environment, :production

# the /init endpoint to let OpenWhisk know our action works.
post '/init' do
  'OK'
end

# /run gets invoked every time our action is called.
post '/run' do
  # extract any parameters used when action was invoked
  payload = begin
    JSON.parse(request.body.read)
  rescue StandardError
    {}
  end

  # YOUR CODE HERE...
  # invoke our own code below. Our example has a highly original hello world.
  message = 'Hello World'
  if payload && payload['value'] && payload['value']['name']
    message = "Hello #{payload['value']['name']}!"
  end

  # Return a response to our serverless action.
  json message: message
end
