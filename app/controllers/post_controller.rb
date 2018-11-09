class PostController < ApplicationController

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  get '/posts/new' do
    erb :create
  end


  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end


  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  patch '/posts/:id' do
    post = Post.find_by_id(params[:id])
    post.update(name: params[:name], content: params[:content])
    redirect to "/posts/#{params[:id]}"
  end

  delete '/posts/:id/delete' do
    Post.find_by_id(params[:id]).destroy
  end

end
