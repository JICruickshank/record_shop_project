get "/add_artist" do
  erb(:"artists/new")
end

post "/artists/new" do
  if Artist.find_id_by_name(params[:name]) == false
    @artist = Artist.new(params)
    @artist.save
    @new_artist = true
  else
    @new_artist = false
  end
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
  @artist = Artist.find_by_id(params[:id])
  erb(:"artists/edit")
end

post "/artists/:id/update" do
  @artist = Artist.find_by_id(params[:id])
  @artist.name = params[:name]
  @artist.update
  erb(:"artists/update")
end
