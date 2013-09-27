require 'sinatra/base'
require 'data_mapper'
require 'haml'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'helpers/application'
require_relative './data_mapper_setup'

require_relative 'controllers/base'
require_relative 'controllers/links'
require_relative 'controllers/tags'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/application'

class Bookmarker < Sinatra::Base
 
######### DEFINE ROUTE PATHS #########
  
  get('/') { Home.call(env) }
  get('/sessions/new') {Sessions.call(env)}
  post('/sessions') {Sessions.call(env)}
  delete('/sessions') {Sessions.call(env)}
  get('/users/new') {Users.call(env)}
  post('/users') {Users.call(env)}
  get ('/links/new') {Links.call(env)}
  post ('/links') {Links.call(env)}
  get ('/tags/:text') {Tags.call(env)}

#######################################
  run! if app_file == $0

end
