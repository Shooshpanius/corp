class Stat::CallStatController < ApplicationController

  before_filter :is_admin

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

  private
  def is_admin
    if !session[:is_admin]
      redirect_to "/"
    end
  end



end
