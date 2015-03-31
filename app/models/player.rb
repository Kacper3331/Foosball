class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :match

  validates :firstname,
    presence: true

  validates :lastname,
    presence: true

  validates :password,
    presence: true
end
