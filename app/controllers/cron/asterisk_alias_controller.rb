class Cron::AsteriskAliasController < ApplicationController

  respond_to :text

  def aliases
    @form_data = {
        aliases: AddressBookCorp.joins(:corp_numbers).where("type_n = ?", 'a')
    }

    respond_to do |format|
      format.text
    end

  end

end
