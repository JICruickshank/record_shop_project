require_relative("../models/albums.rb" )
require_relative("../models/artists.rb")

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

get "/add_album" do
  erb(:"albums/new_artist_and_album")
end

post "/add_album" do
  name = params[:artist_name]
  if Artist.find_id_by_name(name) == false
    new_artist = Hash.new
    new_artist['name'] = name
    @artist = Artist.new(new_artist)
    @artist.save
    params[:artist_id] = @artist.id
    @album = Album.new(params)
    @album.save
    erb(:"albums/create")
  else
    params[:artist_id] = Artist.find_id_by_name(name)
    @album = Album.new(params)
    @album.save
    erb(:"albums/create")
  end
end

post "/artists/:id/delete" do
  @artist = Artist.find_by_id(params[:id])
  @artist.delete
  redirect to "/artists"
end
