get "/add_album" do
  erb(:"albums/new")
end

# can't create album from album form as don't have an artist id. get array of artists, check if artist name is the same and retrive id and set as artist_id if so. Else create new artist, retrieve id number, create new album with artist_id.

post "/albums/new" do
  @album = Album.new(params)
  @album.save
  erb(:"albums/create")
end
