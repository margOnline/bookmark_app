get '/' do
  @links = Link.all
  haml :index
end
