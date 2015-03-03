class IpPhoneType < ActiveRecord::Base

  has_many :ip_phones, dependent: :restrict_with_exception


end
