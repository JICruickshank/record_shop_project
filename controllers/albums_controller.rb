require_relative("../models/albums.rb" )
require_relative("../models/artists.rb")

get "/add_album" do
  erb(:"albums/new_artist_and_album")
end

post "/add_album" do
  if Artist.find_id_by_name(params[:name]) == false
    @artist = Artist.new(params)
    @artist.save
    params[:artist_id] = @artist.id
    @album = Album.new(params)
    @album.save
    erb(:"albums/create")
  else
    params[:artist_id] = Artist.find_id_by_name(params[:name])
    @album = Album.new(params)
    @album.save
    erb(:"albums/create")
  end
end

get "/artists/:id/add_album" do
  @artist = Artist.find_by_id(params[:id])
  erb(:"albums/new")
end

post "/artists/:id/album_added" do
  params[:artist_id] = params[:id]
  @album = Album.new(params)
  @album.save
  erb(:"albums/create")

end

post "/artists/:id/delete" do
  @artist = Artist.find_by_id(params[:id])
  @artist.delete
  redirect to "/artists"
end
