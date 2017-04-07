class SongsController < ApplicationController
  # get '/songs' do
  #   "Hello world"
  #   erb :'/songs/index'
  # end

  get '/songs/:slug' do
    @song = Artist.find_by_slug(params["slug"])
    erb :show
  end
end
