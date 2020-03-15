class WorkoutsController < ApplicationController

 
  get "/workouts" do
    if logged_in?
    @workouts = Workout.all
    erb :"/workouts/index.html"
    else  
      redirect to '/'
    end
  end


  get "/workouts/new" do
    if logged_in?
    erb :"/workouts/new.html"
    else  
      redirect to '/'
    end
  end


  post "/workouts" do
    if params[:name].empty? || params[:muscle_group].empty? || params[:duration].empty? || params[:calories_burned].empty?
      redirect to '/workouts/new'
    end 
      if logged_in?
        workout = Workout.create(params)
        workout.user_id = current_user.id
        workout.save
        redirect "/workouts/#{workout.id}"
    end
  end


  get "/workouts/:id" do
    if @workout = Workout.find_by(:id => params[:id])
    erb :"/workouts/show.html"
    else  
      redirect to '/'
    end
    
  end


  get "/workouts/:id/edit" do
    if logged_in?
    @workout = Workout.find(params[:id])
    erb :"/workouts/edit.html"
    else
   redirect to '/'
    end
  end


  patch "/workouts/:id" do
    @workout = Workout.find(params[:id])
    if logged_in? && @workout.user_id == current_user.id
       @workout.update(params[:workout])
       redirect "/workouts/#{@workout.id}"
      else
      redirect "/workouts/new"
    end
  end

  
  delete "/workouts/:id" do
    if logged_in?
      @workout = Workout.find_by(:id => params[:id]) 
      if @workout.user == current_user
      @workout.destroy
    redirect to "/users/#{current_user.id}"
    end
    else
      redirect to '/'
    end
  end
end
