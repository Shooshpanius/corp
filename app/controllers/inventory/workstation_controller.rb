class Inventory::WorkstationController < ApplicationController
  def index
    @form_data = {
        params: params
    }
  end
end
