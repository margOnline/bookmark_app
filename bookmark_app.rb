require 'sinatra/base'
require 'data_mapper'
require 'haml'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_app_#{env}")

require_relative './lib/link'
require_relative './lib/tag'

DataMapper::finalize
DataMapper.auto_upgrade!

class Bookmarker < Sinatra::Base

  get '/' do
    @links = Link.all
    haml :index
  end

  post '/links' do
    url = params["url"]
    title = params["title"]
    tags = params["tags"].split(" ").map do |tag|
      Tag.first_or_create(:text => tag)
    end
    Link.create(:url => url, :title => title, :tags => tags)
    redirect to('/')
  end

  run! if app_file == $0

end