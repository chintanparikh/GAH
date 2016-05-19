Rails.application.routes.draw do
  root to: 'home#index'

  resources :games, only: [:new, :create, :show, :destroy],:has_many => [:comments]
  resources :gifs, only: [:new, :create]
  resources :players, except: [:index]
  resources :player_games
  resources :prompts, only: [:new, :create]
  resources :player_round_gifs
end
