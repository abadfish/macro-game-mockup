require './config/environment'
class ApplicationController < Sinatra::Base
  set :database_file,'config/database.yml'
  set :session_secret, 'secret_sauce'
  enable :sessions

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
  end

  get '/' do
    @posts = Post.all
    erb :index
  end

  helpers do
    def current_user
      User.find(session[:user_id])
    end

    def is_logged_in?
      !!session[:user_id]
    end
  end

end
