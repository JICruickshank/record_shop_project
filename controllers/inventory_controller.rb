require( "sinatra")
require( "sinatra/contrib/all")
require_relative("../models/albums.rb" )
require_relative("../models/artists.rb")

get "/inventory" do
  @albums = Album.all
  erb(:"inventory/index")
end
