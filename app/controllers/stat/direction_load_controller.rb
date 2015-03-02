class Stat::DirectionLoadController < ApplicationController
  def index

    @conts = SipContext.all

  end





  def srv_get_conts

    @conts = SipContext.select('name').as_json

    render json: @conts


  end

  def srv_get_cont



    respond_to do |format|
      format.json
    end
  end




end
