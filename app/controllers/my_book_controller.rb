class MyBookController < ApplicationController


  def list
  end


  def srv_my_book_edit_show
    @form_data = {
        my_book: MyBook.where('id = ? AND User_id = ?', params[:my_book_id], session[:user_id]).first
    }
    render layout: false
  end


  def srv_get_my_book
    @form_data = {
        my_book: MyBook.get_list(
            params[:first_letter],
            session[:user_id]
        )
    }
    render layout: false
  end


  def srv_my_book_new_save
    if params[:shared].present?
      shared = 1
    else
      shared = 0
    end
    MyBook.create(
        User_id: session[:user_id],
        fio: params[:fio],
        position: params[:pos],
        department: params[:dep],
        organisation: params[:org],
        address: params[:address],
        email_1: params[:email_1],
        email_2: params[:email_2],
        phone_1: params[:phone_1].gsub(/[^0-9]/,''),
        phone_2: params[:phone_2].gsub(/[^0-9]/,''),
        phone_1_add: params[:phone_1_add],
        phone_2_add: params[:phone_2_add],
        cnt_phones: 0,
        cnt_email: 0,
        shared: shared,
        comment: params[:comment]
    )
    render nothing: true
  end


  def srv_my_book_edit_save
    if params[:shared].present?
      shared = 1
    else
      shared = 0
    end

    if MyBook.find(params[:my_book_id]).User_id == session[:user_id]

      MyBook.update(
          params[:my_book_id],
          User_id: session[:user_id],
          fio: params[:fio],
          position: params[:pos],
          department: params[:dep],
          organisation: params[:org],
          address: params[:address],
          email_1: params[:email_1],
          email_2: params[:email_2],
          phone_1: params[:e_phone_1].gsub(/[^0-9]/,''),
          phone_2: params[:e_phone_2].gsub(/[^0-9]/,''),
          phone_1_add: params[:phone_1_add],
          phone_2_add: params[:phone_2_add],
          cnt_phones: 0,
          cnt_email: 0,
          shared: shared,
          comment: params[:comment]
      )

    end

    render nothing: true
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

    else
      render nothing: true

    end


    # render nothing: true

  end



end
