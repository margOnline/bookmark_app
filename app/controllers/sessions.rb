class Sessions < Sinatra::Base
  set :views, File.join(File.dirname(__FILE__), '..', 'views')

  get '/sessions/new' do
    haml :"sessions/new"
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:errors] = ["The email or password are incorrect"]
      haml :"sessions/new"
    end
  end

  delete '/sessions' do
    flash[:notice] = "Good bye!"
    session[:user_id] = nil
    redirect to('/')
  end
end