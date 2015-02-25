class Stat::NumberController < ApplicationController
  def corp

    @form_data = {
        corp_numbers: CorpNumber.where("type_n = ?", 'c').order('number ASC')
    }

  end

  def internal
  end
end
