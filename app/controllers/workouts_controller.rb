class WorkoutsController < ApplicationController

  # GET: /workouts
  get "/workouts" do
    if logged_in?
    @workouts = Workout.all
    erb :"/workouts/index.html"
    else  
      redirect to '/'
    end
  end

  # GET: /workouts/new
  get "/workouts/new" do
    if logged_in?
    erb :"/workouts/new.html"
    else  
      redirect to '/'
    end
  end

  # POST: /workouts
  post "/workouts" do
    #if params = ""
    #redirect to add screen 
    if params[:name] == "" || params[:muscle_group] == "" || params[:duration] == "" || params[:calories_burned] == ""
      redirect to '/workouts/new'
    end 
      if logged_in?
        workout = Workout.create(params)
        workout.user_id = current_user.id
        workout.save
        redirect "/workouts/#{workout.id}"
    end
  end

  # GET: /workouts/5
  get "/workouts/:id" do
    if @workout = Workout.find_by(:id => params[:id])
    erb :"/workouts/show.html"
    else  
      redirect to '/'
    end
    
  end

  # GET: /workouts/5/edit
  get "/workouts/:id/edit" do
    if logged_in?
    @workout = Workout.find(params[:id])
    erb :"/workouts/edit.html"
    else
      #change this redirect 
   redirect to '/'
    end
  end

  # PATCH: /workouts/5
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
      @workout = Workout.find_by_id(params[:id])  
    if @workout && @workout.user_id == current_user.id
      @workout.delete
    redirect to '/workouts'
    end
    else
      redirect to '/'
      # redirect to '/workouts/new'
    end
  end
end
