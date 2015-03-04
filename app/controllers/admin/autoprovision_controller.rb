class Admin::AutoprovisionController < ApplicationController

  def index
    phone_types =  IpPhoneType.all.map { |model| [model.model, model.id] }

    devices = IpPhone.all.order('mac asc, account_number asc')

    @form_data = {
        phone_types: phone_types,
        devices: devices
    }
  end


  def srv_device_new_save
    acc_count = IpPhoneType.find(params[:phone_model]).num_account
    for k in 1..acc_count do
      IpPhone.create(
          mac: params[:MAC].gsub(':', ''),
          ip_phone_type_id: params[:phone_model],
          account_number: k,
          building: params[:building],
          room: params[:room],
      )
    end

    render nothing: true
  end


  def srv_device_edit_save

      IpPhone.update(
          params[:id_edit],
          corp_number: params[:corp_number_edit],
          building: params[:building_edit],
          room: params[:room_edit],
      )


    render nothing: true
  end

  def srv_device_edit_show

    @form_data = {
        device: IpPhone.find(params[:device_id])
    }

    render layout: false

  end

end
