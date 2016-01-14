class AddressBookController < ApplicationController

  before_filter :is_login

  require 'socket'      # Sockets are in standard library

  def list

    if params[:id].to_s.length == 1
      @form_data = {
          address_book: AddressBookCorp.where('fio like ? and (have_phones = ? or have_email = ?)', params[:id].to_s+'%', 1, 1).order('fio ASC'),
      }
    elsif params[:id].to_s == 'all'
      @form_data = {
          address_book: AddressBookCorp.where('have_phones = ? or have_email = ?', 1, 1).order('fio ASC'),
      }
    elsif params[:id].to_s == 'fav'
      favorite = Favorite.where('user_id = ?', session[:user_id])
      ids = Array.new
      favorite.each do |fav|
        ids.push(fav.address_book_corp_id)
      end
      @form_data = {
          address_book: AddressBookCorp.where('(have_phones = ? or have_email = ?) and id IN (?)', 1, 1, ids).order('fio ASC'),
          favorite: favorite
      }
    end

  end


  def srv_call

    address_book_corp_id = AddressBookCorp.where('login = ?', session[:user_login])[0]

    num_a = CorpNumber.where('address_book_corp_id = ? and type_n = ?', address_book_corp_id.id, 'a')

    if num_a.size != 0
      num = num_a[0].number
    else
      num = CorpNumber.where('address_book_corp_id = ? and type_n = ?', address_book_corp_id.id, 'i')[0].number
    end

    # num = CorpNumber.where('address_book_corp_id = ? and type_n = ?', address_book_corp_id.id, 'i')[0].number

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


    elsif num.length == 3
      hostname = '10.17.2.102'
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
      s.puts ("Context: #{cont}\r\n")
      s.puts ("Exten: #{params[:number]}\r\n")
      s.puts ("Priority: 1\r\n\r\n")
      s.puts ("Action: Logoff\r\n\r\n")

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


  def srv_info_show

    address_info =  AddressBookCorp.find(params[:address_id])

    @form_data = {
        address_info: address_info
    }

    render layout: false

  end

  def srv_favorite

    if session[:user_id] != nil

      favorite = Favorite.where('user_id = ? and address_book_corp_id = ?', session[:user_id], params[:address_id])

      if favorite.size == 0
        Favorite.create(
            user_id: session[:user_id],
            address_book_corp_id: params[:address_id]
        )
        render text: 'cr'
      else
        Favorite.destroy(favorite[0].id)
        render text: 'r'
      end
     end
    # render layout: false

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
