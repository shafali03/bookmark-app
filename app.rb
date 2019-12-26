require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require_relative './lib/bookmark'
require_relative './lib/comment'
require_relative './database_connection_setup.rb'


class BookmarkApp < Sinatra::Base 

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :"/viewing_bookmark"
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.create(url: params['url'], title: params[:title])
    else
      flash[:notice] = "Must submit valid URL."
    end
  
    redirect('/bookmarks')
  end
#not sure if needed
  # post '/bookmarks' do 
  #   Bookmark.create(url: params[:url], title: params[:title])
  #   redirect '/bookmarks' 
  # end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("DELETE FROM bookmarks WHERE id = #{params['id']}")
    # redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end


  patch '/bookmarks/:id' do
    Bookmark.edit(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments' do
    Comment.create(bookmark_id: params[:id], text: params[:comment])
    # connection = PG.connect(dbname: 'bookmark_app_test')
    # connection.exec("INSERT INTO comments (text, bookmark_id) VALUES('#{params[:comment]}', '#{params[:id]}');")
    redirect '/bookmarks'
  end
  
  
run! if app_file == $0
end