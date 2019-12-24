require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require_relative './lib/bookmark'
require_relative './database_connection_setup.rb'


class BookmarkApp < Sinatra::Base 

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :viewing_bookmark
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit valid URL" unless Bookmark.create(url: params[:url], title: params[:title])
    redirect('/bookmarks')
  end

  post '/bookmarks' do 
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks' 
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmarks = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    p params
    Bookmark.edit(id: params[:id], url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  
  
run! if app_file == $0
end