class Cron::AsteriskInternalController < ApplicationController

  respond_to :text

  def list1
    @form_data = {
        int_numbers: CorpNumber.where("type_n = ?", 'i')
    }
    respond_to do |format|
      format.text
    end
  end

  def list2
    @form_data = {
        int_numbers: CorpNumber.where("type_n = ?", 'i')
    }
    respond_to do |format|
      format.text
    end
  end

end
