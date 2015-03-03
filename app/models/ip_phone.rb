class IpPhone < ActiveRecord::Base

  belongs_to :ip_phone_type
  belongs_to :corp_number


end
