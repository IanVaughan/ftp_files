module Net
  class FTP
    def makepasv # :nodoc:
      if @sock.peeraddr[0] == "AF_INET"
        #host, port = parse227(sendcmd("PASV")) #WAS!
        host, port = parse229(sendcmd("EPSV"))
      else
        host, port = parse229(sendcmd("EPSV"))
      end
      return host, port
    end
  end
end
