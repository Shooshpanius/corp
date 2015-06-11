class Pbxadmin::InternationalAccessController < ApplicationController
  def index
    ia = PbxInternationalAccess.all
    @form_data = {
        ia: ia
    }
  end
end
