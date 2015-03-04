class Admin::AutoprovisionController < ApplicationController
  def index

    phone_types =  IpPhoneType.all.map { |model| [model.model, model.id] }


    @form_data = {
        phone_types: phone_types
    }

  end
end
