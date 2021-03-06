require 'rack-flash'
class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    unless is_logged_in?
      erb :'/users/create_user'
    else
      redirect '/trades'
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.username == "" || @user.username == nil
      redirect '/signup'
    elsif @user.email == "" || @user.email == nil
      redirect '/signup'
    elsif @user.password == "" || @user.password == nil
      redirect '/signup'
    else
      @user.save
    end
    session[:user_id] = @user.id
    redirect'/trades'
  end

  get '/login' do
    unless is_logged_in?
      erb :'/users/login'
    else
      redirect '/'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/trades"
    else
      redirect '/signup'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  get '/logout' do
    if is_logged_in?
      session.clear
      redirect '/'
    else
      redirect '/'
    end
  end
end
