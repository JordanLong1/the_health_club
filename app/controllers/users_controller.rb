class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    if logged_in?
    erb :"/users/index.html"
    else  
      redirect to '/'
    end
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
    if params[:name] == "" || params[:email] == "" || params[:username] == "" || params[:password] == ""
      redirect to '/'
      else
    user = User.create(params)
    session[:user_id] = user.id
    redirect to "/users/#{user.id}"
      end
  end

  get '/logout' do 
    if session[:user_id] != nil 
      session.clear
    redirect to '/'
    end
  end
  
  post "/users" do
    @user = User.find_by(params[:user_id])
    @user.save
    if @user 
      session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    if logged_in?
    @user = User.find(params[:id])
    erb :"/users/show.html"
    else  
      redirect to '/'
    end
  end


end
