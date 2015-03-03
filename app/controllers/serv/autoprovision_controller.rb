class Serv::AutoprovisionController < ApplicationController

  def get_cfg
    if params[:id] == 'y000000000025'
      render 'get_cfg'
    else
      render nothing: true
    end
  end


end
