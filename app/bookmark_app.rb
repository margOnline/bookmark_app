require 'sinatra/base'
require 'data_mapper'
require 'haml'
require 'rack-flash'
require 'sinatra/partial'

require_relative '../lib/link'
require_relative '../lib/tag'
require_relative '../lib/user'
require_relative './data_mapper_setup'


class Bookmarker < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  set :partial_template_engine, :haml

  run! if app_file == $0

end