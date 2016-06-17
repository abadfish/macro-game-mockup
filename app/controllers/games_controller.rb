require 'rack-flash'
class GamesController < ApplicationController
  use Rack::Flash

  get '/game' do
    erb :'/games/game'
  end
end
