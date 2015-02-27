class Stat::CallStatController < ApplicationController
  def index

    @form_data = {
        calls: Call.all
    }

  end
end
