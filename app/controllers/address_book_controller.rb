class AddressBookController < ApplicationController

  require 'socket'      # Sockets are in standard library

  def list

    if params[:id].to_s.length == 1
      @form_data = {
          address_book: AddressBookCorp.where('fio like ?', params[:id].to_s+'%').order('fio ASC'),
      }
    else
      @form_data = {
          address_book: AddressBookCorp.all.order('fio ASC'),
      }
    end



  end


  def srv_call



    hostname = '192.168.2.40'
    port = 5038

    s = TCPSocket.open(hostname, port)

    s.puts ("Action: login\r\n")
    s.puts ("Username: mngr\r\n")
    s.puts ("Secret:123qwe\r\n")
    s.puts ("Events: off\r\n\r\n")

    s.puts ("Action: Originate\r\n")
    s.puts ("Channel: SIP/1001\r\n")
    s.puts ("Callerid: 1001\r\n")
    # s.puts ("Timeout: 10000\r\n")
    s.puts ("WaitTime: 5\r\n")
    s.puts ("Context: from-internal\r\n")
    s.puts ("Exten:1038\r\n")
    s.puts ("Priority: 1\r\n")
    s.puts ("Exten:1003\r\n")
    s.puts ("Priority: 1\r\n\r\n")


    # s.puts ("Async: yes\r\n\r\n" )
    s.puts ("Action: Logoff\r\n\r\n")
    # sleep 1.5

    while line = s.gets   # Read lines from the socket
      a = a.to_s + line.chop.to_s      # And print with platform line terminator
    end




    s.close               # Close the socket when done

    render text: ' - ' + a.to_s
    # render nothing: true

  end


end
