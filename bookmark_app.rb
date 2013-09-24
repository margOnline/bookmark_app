require 'sinatra/base'
require 'data_mapper'
require 'haml'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_app_#{env}")

require_relative './lib/link'

DataMapper::finalize
DataMapper.auto_upgrade!

class Bookmarker < Sinatra::Base

  get '/' do
    @links = Link.all
    # set :views, File.join(File.dirname(__FILE__), '..', 'views')
    haml :index
  end

  post '/links' do
    url = params["url"]
    title = params["title"]
    Link.create(:url => url, :title => title)
    redirect to('/')
  end

  run! if app_file == $0

end