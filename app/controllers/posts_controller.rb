require 'rack-flash'
class PostsController < ApplicationController
  use Rack::Flash

  helpers do
    def img(name)
      "<img src='images/#{name}' alt='#{name}' />"
    end
  end


  get '/posts' do
    if is_logged_in?
      @posts = Post.all
      erb :'index'
    else
      redirect '/login'
    end
  end

  post '/posts' do
    if is_logged_in?
      if params[:content] != ""
        @post = Post.create(params)
        @post.user_id = current_user.id

        @post.save
        redirect "/posts/#{@post.id}"
      else
        redirect '/posts/new'
      end
    else
      redirect '/login'
    end
  end

  get '/posts/new' do
    if is_logged_in?
      erb :'/posts/new_post'
    else
      redirect '/login'
    end
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    if is_logged_in?
      erb :'/posts/show_post'
    else
      redirect '/login'
    end
  end

  get '/posts/:id/edit' do
    if is_logged_in?
      @post = Post.find(params[:id])
      if session[:user_id] == @post.user_id
        erb :'/posts/edit_post'
      else
        redirect "/posts"
      end
    else
      redirect '/login'
    end
  end

  patch '/posts/:id' do
    if params[:content] != ""
      @post = Post.find_by_id(params[:id])
      @post.content = params[:content]
      @post.save
      redirect "/posts/#{@post.id}"
    else
      redirect "/posts/#{params[:id]}/edit"
    end
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    if session[:user_id] == @post.user_id
      @post.delete
      redirect '/'
    else
      redirect '/'
    end
  end


end
