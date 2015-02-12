class AddressBookController < ApplicationController

  before_filter :is_login

  require 'socket'      # Sockets are in standard library

  def list

    if params[:id].to_s.length == 1
      @form_data = {
          address_book: AddressBookCorp.where('fio like ? and (have_phones = ? or have_email = ?)', params[:id].to_s+'%', 1, 1).order('fio ASC'),
      }
    else
      @form_data = {
          address_book: AddressBookCorp.where('have_phones = ? or have_email = ?', 1, 1).order('fio ASC'),
      }
    end



  end


  def srv_call

    address_book_corp_id = AddressBookCorp.where('login = ?', session[:user_login])[0]
    num = CorpNumber.where('address_book_corp_id = ? and type_n = ?', address_book_corp_id.id, 'i')[0].number

    if num[0] == '1'
      cont = 'internal-vlk'
    end

    if num[0] == '2'
      cont = 'internal-ts'
    end

    if num[0] == '3'
      cont = 'internal-vlk'
    end



    if num.length == 4
      hostname = '192.168.2.40'
      port = 5038

      s = TCPSocket.open(hostname, port)

      s.puts ("Action: login\r\n")
      s.puts ("Username: webr\r\n")
      s.puts ("Secret:123qwe\r\n")
      s.puts ("Events: on\r\n\r\n")

      s.puts ("Action: Originate\r\n")
      s.puts ("Channel: SIP/#{num}\r\n")
      s.puts ("Callerid: #{num}\r\n")
      s.puts ("Timeout: 10000\r\n")
      s.puts ("WaitTime: 50\r\n")

      # if num.number[0] == '1'
      #   s.puts ("Context: internal-vlk\r\n")
      # end
      #
      # if num.number[0] == '2'
      #   s.puts ("Context: internal-ts\r\n")
      # end
      #
      # if num.number[0] == '3'
      #   s.puts ("Context: internal-vlk\r\n")
      # end


      s.puts ("Context: #{cont}\r\n")

      s.puts ("Exten: #{params[:number]}\r\n")
      s.puts ("Priority: 1\r\n\r\n")


      # s.puts ("Async: yes\r\n\r\n" )
      # s.puts ("Exten:#{params[:number]}\r\n")
      s.puts ("Action: Logoff\r\n\r\n")
      # sleep 1.5

      while line = s.gets   # Read lines from the socket
        a = a.to_s + line.chop.to_s      # And print with platform line terminator
      end




      s.close               # Close the socket when done

      render text: ' - ' + a.to_s

    else
      render nothing: true

    end


    # render nothing: true

  end




  private
  def is_login
    if !session[:is_login]
      user = User.where("auth_hash = ?", cookies[:hash]).take(1)
      if user.size == 1
        session[:is_login] = true
        session[:user_id] = user[0].id
        session[:user_login] = user[0].login
        session[:is_admin] = true if user[0].site_admin
      end
    end
  end


end
