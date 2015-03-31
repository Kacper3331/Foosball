class MatchesController < ApplicationController
  before_action :set_match, only: [:show]

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    Match.players_ids(params[:match][:player_ids].reject(&:empty?), @match)
    if @match.save
      redirect_to root_path, notice: 'Match was successfully created.'
    else
      render :new
    end
  end

  private
  def set_match
    @match ||= Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(
      :first_player_id,
      :second_player_id,
      :first_player_score,
      :second_player_score,
      :date
    )
  end
end
