class Serv::AutoprovisionController < ApplicationController

  def get_cfg
    if params[:id] == 'y000000000025'
      render 'get_main_yealink_cfg'
    else
      mac = IpPhone.find_by_mac(params[:id])
      if mac != nil
        @form_data = {
            device: mac
        }
        render 'get_mac_yealink_cfg'
      else
        render text: 'Not found'
      end
    end
  end


end
