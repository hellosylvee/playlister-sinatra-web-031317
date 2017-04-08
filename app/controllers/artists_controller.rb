class ArtistsController < ApplicationController
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
end
