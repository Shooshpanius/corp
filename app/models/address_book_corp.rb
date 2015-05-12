class AddressBookCorp < ActiveRecord::Base

  has_many :corp_numbers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one  :mail_forwarding, dependent: :destroy

end
