require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkApp < Sinatra::Base 
  get '/' do
    'Bookmark App'
  end

get '/bookmarks' do
  @bookmarks = Bookmark.all
  erb :"bookmarks/index"
end

get '/bookmarks/new' do
  erb :"bookmarks/new"
end

post '/bookmarks/new' do 
  Bookmark.create(url: params[:url], title: params[:title])
  redirect '/bookmarks' 
end




run! if app_file == $0
end