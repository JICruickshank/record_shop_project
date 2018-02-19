get "/add_artist" do
  erb(:"artists/new")
end

post "/artists/new" do
  @artist = Artist.new(params)
  @artist.save
  erb(:"artists/create")
end

get "/artists"  do
  @artists = Artist.all
  erb(:"artists/index")
end

get "/artists/:id" do
  @artist = Artist.find_by_id(params[:id])
  @albums = @artist.albums
  erb(:"artists/show")
end

get "/artists/:id/edit_artist_name" do
  erb(:"artists/edit")
end
