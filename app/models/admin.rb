class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable,  and :omniauthable :registerable, :recoverable, :rememberable, :validatable
  devise :database_authenticatable,:timeoutable, :trackable

end
