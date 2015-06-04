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



end
