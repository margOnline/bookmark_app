class Home < Sinatra::Base

  set :views, File.join(File.dirname(__FILE__), '..', 'views')

  get '/' do
    @links = Link.all
    haml :index
  end
end


