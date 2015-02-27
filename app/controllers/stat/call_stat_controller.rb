class Admin::CallStatController < ApplicationController
  def index

    @form_data = {
        calls: Call.all
    }

  end
end
