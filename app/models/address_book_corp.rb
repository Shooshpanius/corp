class AddressBookCorp < ActiveRecord::Base

  has_many :corp_numbers, dependent: :destroy


end
