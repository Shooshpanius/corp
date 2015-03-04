class Favorite < ActiveRecord::Base

  belongs_to :address_book_corp
  belongs_to :user


end
