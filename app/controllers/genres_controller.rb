class GenresController < ApplicationController
  get '/genres/:slug' do
    @genre = Artist.find_by_slug(params["slug"])
    erb :show
  end
end
