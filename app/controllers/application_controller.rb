
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do 
    @posts = Post.all

    erb :'/index'
  end

  get '/posts/new' do
    erb :'/new'
  end


  post '/posts' do 
    p = Post.new(params)
    p.save
    redirect "/posts"
  end
  
  get '/posts/:id/edit' do
    @p = Post.find_by_id(params[:id])
    erb :'/edit'
  end


  delete '/posts/:id/delete' do 
    @p = Post.find_by_id(params[:id])
    @p.destroy
    erb :'/delete'
  end

  patch "/posts/:id" do
  
    @p = Post.find_by_id(params[:id])    
    params.delete("_method")
    if @p.update(params)
      redirect "/posts/#{@p.id}"
    else
      redirect "/posts/#{@p.id}/edit"
    end
  end

  get '/posts/:id' do
    @p = Post.find_by_id(params[:id])
  
    if @p 
      erb :'/show'
    else
      redirect "/posts"
    end
  end




end