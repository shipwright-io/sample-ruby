require 'sinatra'
STDOUT.sync = true
STDERR.sync = true

get '/' do
<<-RESPONSE
Healthy
It just needed to be restarted!
RESPONSE
end

get '/log/:message' do
  message = params[:message]
  STDOUT.puts(message)
  "logged #{message} to STDOUT"
end

Thread.new do
  while true do
    STDOUT.puts "Tick: #{Time.now.to_i}"
    sleep 1
  end
end