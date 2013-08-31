require 'socket'


def tcp_server_sockets(port)
  ipv4_socket = TCPServer.new(port)

  ipv6_socket = Socket.new(:INET, :STREAM)
  addr = Addrinfo.tcp('::', port)
  ipv6_socket.bind(addr)
  ipv6_socket.listen(Socket::SOMAXCONN)

  [ipv4_socket, ipv6_socket]
end

def accept_loop(sockets, &block)
  loop do
    readable, _ = IO.select(sockets)

    readable.each do |socket|
      client, _ = socket.accept
      block.call(client)
    end
  end
end

sockets = Socket.tcp_server_sockets(3030)

accept_loop(sockets) do |client|
  client.write(client.read * 3)
  client.close
end
