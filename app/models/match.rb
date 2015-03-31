class Match < ActiveRecord::Base
  has_many :players

  validates :first_player_score,
    numericality: true,
    presence: true

  validates :second_player_score,
    numericality: true,
    presence: true

  validates :date,
    presence: true

  validates :players,
    presence: true

end
