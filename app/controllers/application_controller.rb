require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    redirect to '/signup'
  end

  get '/signup' do 
    erb :signup
  end

  post '/signup' do 
    
  end

end
