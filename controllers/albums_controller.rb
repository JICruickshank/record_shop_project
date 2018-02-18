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
  if Artist.artist_already_exists(params[:artist_name]) == false
    new_artist = Hash.new
    new_artist['name'] = params[:artist_name]
    @artist = Artist.new(new_artist)
    @artist.save
    params[:artist_id] = @artist.id
    @album = Album.new(params)
    @album.save
    erb(:"albums/create")
  else
    params[:artist_id] = Artist.artist_already_exists(params[:artist_name])
    @album = Album.new(params)
    @album.save
    erb(:"albums/create")
  end

end
