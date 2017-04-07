class ArtistsController < ApplicationController
  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params["slug"]) #Artist.find_by_slug('taylor-swift')
    erb :show
  end
end
