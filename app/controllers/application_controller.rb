require 'pry'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  #ARTISTS
  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do #taylor-swift
    @artist = Artist.find_by_slug(params[:slug])
    @songs = @artist.songs
    @genres = @artist.genres
    erb :'/artists/show'
  end

  ##SONGS
  #We will create a new request to find an individual song

  #READ
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  ##show action
  get '/songs/:slug' do #blank-spaces
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    @genres = @song.genres
    erb :'/songs/show'
  end

  #CREATE

  #UPDATE

  #DELETE

  ##GENRES
  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @artists = @genre.artists
    @songs = @genre.songs
    erb :'/genres/show'
  end


end
