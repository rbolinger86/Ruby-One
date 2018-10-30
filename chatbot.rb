require 'socket'
#Defining IRC Connection
server = 'irc.freenode.net'
port = 6667
socket = TCPSocket.open(server, port)
nickname = 'ChatterBot'
channel = '#StarWarsBeatles'

socket.puts "NICK #{nickname}"
socket.puts "USER #{nickname} 0 * #{nickname}"
socket.puts "JOIN #{channel}"
socket.puts "PRIVMSG #StarWarsBeatles :Hello there!"
#Getting IRC messages
while message = socket.gets do
  puts message
  if message.match('^PING :')
    server = message.split(':').last
    puts "PONG #{server}"
    socket.puts "PONG #{server}"
  elsif message.match('How are you?')
    socket.puts "PRIVMSG #StarWarsBeatles :I'm great, thanks!"
  end
  $stdout.flush
end
