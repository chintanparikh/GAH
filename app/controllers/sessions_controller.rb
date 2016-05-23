class SessionsController < ApplicationController


  def create
    session[:username] = params[:username]

    cookies.signed[:user_id] = params[:user_id]

    @player=Player.find_or_create_by(username: params[:username])
    session[:user_id] = @player.id

    #existing game
    @game=Game.find_or_create_by(id: params[:existing_game_number])
    
    @game.players << @player # shovel all the player into the game that they specify
    @player.starting_hand

    redirect_to game_path(@game)
  end
end
