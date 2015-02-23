class Cron::AsteriskInternalController < ApplicationController

  respond_to :text

  def list

    @form_data = {
        aaa: '111',
        int_numbers: CorpNumber.where("type_n = ?", 'i')
    }

    @form_data1 = 'qwe'

    respond_to do |format|
      format.text
    end

  end


end
