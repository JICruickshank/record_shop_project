require_relative("../models/albums.rb" )
require_relative("../models/artists.rb")

get "/inventory" do
  @albums = Album.all
  erb(:"inventory/index")
end

post "/inventory/:id/delete" do
  album_id = params[:id].to_i
  @album = Album.find_by_id(album_id)
  @album.delete
  erb(:"inventory/delete")
end

get "/inventory/:id" do
  album_id = params[:id].to_i
  @album = Album.find_by_id(album_id)
  erb(:"inventory/show")
end

get "/inventory/:id/edit" do
  album_id = params[:id].to_i
  @album = Album.find_by_id(album_id)
  erb(:"inventory/edit")
end

post "/inventory/:id" do
  artist_name = params[:name]
  if Artist.find_id_by_name(artist_name) == false
    artist = Hash.new
    artist['name'] = artist_name
    @artist = Artist.new(artist)
    @artist.save
    params[:artist_id] = @artist.id
    @album = Album.new(params)
    @album.update
  else
    artist_id = Artist.find_id_by_name(artist_name)
    params[:artist_id] = artist_id
    @album = Album.new(params)
    @album.update
  erb(:"inventory/update")
  end
end
