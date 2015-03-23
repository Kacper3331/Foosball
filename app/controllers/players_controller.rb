class PlayersController < ApplicationController
  before_action :set_player, only: [:show]

  def show
  end

  private
  def set_player
    @player = Player.find(params[:id])
  end
end
