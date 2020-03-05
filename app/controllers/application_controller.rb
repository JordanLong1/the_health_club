require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    # binding.pry
    erb :welcome
  end

  post '/login' do 
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect to "/users/#{user.id}"
    else
      redirect to '/'
    end
  
  end

  post '/signup' do 
    user = User.create(params)
    session[:user_id] = user.id
    redirect to "/users/#{user.id}"
  end

  get '/logout' do 
    if session[:user_id] != nil 
      session.clear
    redirect to '/'
    end
  end


end
