class Users < Sinatra::Base

  set :views, File.join(File.dirname(__FILE__), '..', 'views')
  
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
end