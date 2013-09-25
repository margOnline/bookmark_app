require 'sinatra/base'
require 'data_mapper'
require 'haml'
require 'rack-flash'

require_relative '../lib/link'
require_relative '../lib/tag'
require_relative '../lib/user'
require_relative './data_mapper_setup'

class Bookmarker < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end
  end

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

  get '/tags/:text' do
    tag = Tag.first(:text => params[:text])
    @links = tag ? tag.links : []
    haml :index
  end

  get '/users/new' do
    # in quotes because ruby would try to divide the symbol by new
    @user = User.new
    haml :"users/new"
  end

  post '/users' do
    @user = User.create(:email => params[:email],
                :password => params[:password],
                :password_confirmation => params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      haml :"users/new"
    end
  end

  run! if app_file == $0

end