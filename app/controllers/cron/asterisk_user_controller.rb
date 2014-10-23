class Cron::AsteriskUserController < ApplicationController

  respond_to :text

  def users

    @form_data = {
        address_book: AddressBookCorp.joins(:corp_numbers).where("type_n = ?", 'c')
    }

    respond_to do |format|
      format.text
    end

  end


end
