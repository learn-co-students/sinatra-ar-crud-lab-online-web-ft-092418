
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  get "/posts" do
    @posts = Post.all
    erb :index
  end

  post "/posts" do
    @new_post = Post.create(params)

  #  binding.pry
    erb :show
  end

  get "/posts/:id" do
    @new_post = Post.find_by_id(params[:id])
    erb :show
  end

  get "/posts/:id/edit" do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch "/posts/:id" do
    #binding.pry
    post = Post.find_by_id(params[:id])
    params.delete("_method")
    @post = post.update(params)

    #binding.pry
    erb :show
  end

  delete "/posts/:id/delete" do
    Post.find_by_id(params[:id]).destroy
  end
end
