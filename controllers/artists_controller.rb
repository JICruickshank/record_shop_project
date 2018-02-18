get "/add_artist" do
  erb(:"artists/new")
end

post "/artists/new" do
  @artist = Artist.new(params)
  @artist.save
  erb(:"artists/create")
end
