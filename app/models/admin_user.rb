class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable :registerable,
  #          :recoverable, :rememberable, :validatable, :trackable
  devise :database_authenticatable, :timeoutable
end
