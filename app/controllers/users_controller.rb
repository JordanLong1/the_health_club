class UsersController < ApplicationController


  
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
    if params[:username].empty? || params[:password].empty?
      redirect to '/'
    elsif user = User.find_by(:username => params[:username])
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

  
  get "/users/:id" do
    if logged_in?
    @user = User.find_by(:id => params[:id])
    erb :"/users/show.html"
    else  
      redirect to '/'
    end
  end

  get "/users/:id/edit" do 
    if logged_in?
      @user = User.find_by(:id => params[:id])
      erb :"/users/edit.html"
    else
      redirect to '/'
    end
  end

  patch "/users/:id" do 
      @user = User.find_by(:id => params[:id])
      if  logged_in? && @user == current_user
        @user.update(:name => params[:name], :username => params[:username])
        redirect to "/users/#{@user.id}"
      else
        redirect to "/users/#{@user.id}/edit"
      end
  end

  delete "/users/:id" do 
    if logged_in?
    @user = User.find(params[:id])
    if @user == current_user
        @user.destroy
        session.clear
        redirect to '/'
    else 
      redirect to '/'
    end
    end
  end


end
