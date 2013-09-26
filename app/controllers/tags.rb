class Tags < Sinatra::Base

  set :views, File.join(File.dirname(__FILE__), '..', 'views')
  
  get '/tags/:text' do
    tag = Tag.first(:text => params[:text])
    @links = tag ? tag.links : []
    haml :index
  end
end