class PlayersController < ApplicationController
  before_action :set_player, only: [:show]

  def show
      @recent_match = recent_match(player)
  end

  private
  def recent_match(player)
    recent_match_first = Match.select(:first_player_id, 'first_player_score as score' ,'second_player_id as oponent', :date).where(first_player_id: player.id)
    recent_match_second = Match.select(:second_player_id, 'second_player_score as score' ,'first_player_id as oponent', :date).where(second_player_id: player.id)

    if recent_match_first.empty?
      return @match = recent_match_second.last
    end

    if recent_match_second.empty?
      return @match = recent_match_first.last
    end

    if !recent_match_first.empty? && !recent_match_second.empty?
      if recent_match_first.last.date < recent_match_second.last.date
        @match = recent_match_second.last
      else
        @match = recent_match_first.last
      end
    end
  end
  def set_player
    @player = Player.find(params[:id])
  end
end
