class Home < BookmarkApp
  register Sinatra::Partial
  set :views, File.join(File.dirname(__FILE__), '..', 'views')
  set :partial_template_engine, :haml
  
  get '/' do
    @links = Link.all
    haml :index
  end
end


