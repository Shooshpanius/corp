class User < ActiveRecord::Base

  has_many :favorites, dependent: :destroy


end
