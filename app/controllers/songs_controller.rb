class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do #blank-spaces
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    @genres = @song.genres
    erb :'/songs/show'
  end
end
