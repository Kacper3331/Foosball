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

  def self.players_ids(player_ids, match)
    match.first_player_id = player_ids.first.to_i
    match.second_player_id = player_ids.last.to_i
  end
end
