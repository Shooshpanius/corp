class Stat::CallStatController < ApplicationController

  def index
    @form_data = {
        calls: Call.all
    }
  end


  def srv_get_audio_modal

    @form_data = {
        call: Call.where('uniqueid = ?', params[:uniqueid]).first
    }


    render layout: false
  end




end
