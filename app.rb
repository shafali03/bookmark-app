require 'sinatra/base'
require './lib/bookmark'

class BookmarkApp < Sinatra::Base 
  get '/' do
    'Bookmark App'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  
end

run! if app_file == $0
end