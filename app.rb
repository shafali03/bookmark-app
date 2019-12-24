require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkApp < Sinatra::Base 

  enable :sessions, :method_override


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
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks' 
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end


run! if app_file == $0
end