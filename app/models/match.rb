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

  def self.players_ids(player_ids, match)
    match.first_player_id = player_ids.first.to_i
    match.second_player_id = player_ids.last.to_i
  end

  scope :select_first_player, -> {
    select(:first_player_id, 'first_player_score as score' ,'second_player_id as oponent', :date)
  }
end
