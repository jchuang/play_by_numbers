class PlaysController < ApplicationController

  def index
    @plays = Play.all
  end

  def show
    @play = Play.find(params[:id])
    @speakers = Speaker.where(play_id: params[:id]).sort_speakers(params)
    @total_scenes = @play.scenes.count
  end

end
