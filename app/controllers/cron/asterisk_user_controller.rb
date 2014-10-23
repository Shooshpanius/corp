class Cron::AsteriskUserController < ApplicationController

  respond_to :text

  def index



  end

  def users

    @form_data = {
        address_book: AddressBookCorp.joins(:corp_numbers).where("type_n = ?", 'c')
        #address_book: AddressBookCorp.find_by_sql('SELECT * FROM address_book_corps LEFT JOIN corp_numbers ON corp_numbers.address_book_corp_id = address_book_corps.id WHERE corp_numbers.type_n = "c" ')
    }

    respond_to do |format|
      format.text
    end

  end


end
