class PlayersController < ApplicationController
  before_action :set_player, only: [:show]

  def show
    player = set_player
    @check = check(player)
    if !@check.empty?
      recent_match_information(player)
      statistic_information(player)
    end
  end

  private

  def statistic_information(player)
    @matches_played = matches_played(player)
    @won_matches = win_matches(player)
    @lost_matches = lose_matches(player)
    @averange_win_lost = averance_wins_lost(@won_matches, @lost_matches, @matches_played)
    @averange_points = averange_points(player, @matches_played).round(2)
    @sum_points = sum_points(player, @matches_played)
  end

  def recent_match_information(player)
    @recent_match = recent_match(player)
    @oponent = Player.find_by_id(@recent_match.oponent)
  end

  def check(player)
    Match.where('first_player_id = ? OR second_player_id = ?', player.id, player.id)
  end

  def recent_match(player)
    recent_match_first = Match.select_first_player.where(first_player_id: player.id)
    recent_match_second = Match.select_second_player.where(second_player_id: player.id)

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

  def matches_played(player)
    @matches = Match.where('first_player_id = ? OR second_player_id = ?', player.id, player.id).count
  end

  def win_matches(player)
    matches_first = Match.select(:first_player_score).where(first_player_id: player.id)
    matches_second = Match.select(:second_player_score).where(second_player_id: player.id)
    @winner = matches_first.won_match_first_player + matches_second.won_match_second_player
  end

  def lose_matches(player)
    matches_first = Match.select(:first_player_score).where(first_player_id: player.id)
    matches_second = Match.select(:second_player_score).where(second_player_id: player.id)
    @loser = matches_first.lost_match_first_player + matches_second.lost_match_second_player
  end

  def averance_wins_lost(won, lost, played)
    @averange = (won.to_f + lost.to_f) / played.to_f
  end

  def averange_points(player, played)
    sum = sum_points(player, played)
    @average = (sum) / played.to_f
  end

  def sum_points(player, played)
    matches_first = Match.select(:first_player_score).where(first_player_id: player.id)
    matches_second = Match.select(:second_player_score).where(second_player_id: player.id)
    sum_score_first = matches_first.map(&:first_player_score).sum
    sum_score_second = matches_second.map(&:second_player_score).sum
    @sum = sum_score_first + sum_score_second
  end

  def set_player
    @player = Player.find(params[:id])
  end
end
