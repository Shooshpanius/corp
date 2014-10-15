class AddressBookController < ApplicationController
  def index

    @form_data = {
        address_book: AddressBookCorp.all.order('fio ASC'),
    }



  end
end
