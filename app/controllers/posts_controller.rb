require 'rack-flash'
class PostsController < ApplicationController
  use Rack::Flash

  get '/posts' do
    if is_logged_in?
      @posts = Post.all
      erb :'/blog/posts'
    else
      redirect '/login'
    end
  end

  post '/posts' do
    if is_logged_in?
      if params[:content] != ""
        @post = Tweet.create(params)
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

  end
end
