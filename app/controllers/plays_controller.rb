class PlaysController < ApplicationController

  def index
    @plays = Play.all
  end

  def show
    @play = Play.find(params[:id])
  end

end
