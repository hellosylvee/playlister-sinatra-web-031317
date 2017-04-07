class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params["slug"]) #Artist.find_by_slug('taylor-swift')
    erb :show
  end

  # get '/genres/:slug' do
  #   @genre = Artist.find_by_slug(params["slug"])
  #   erb :show
  # end
  #
  # get '/songs/:slug' do
  #   @song = Artist.find_by_slug(params["slug"])
  #   erb :show
  # end

end
