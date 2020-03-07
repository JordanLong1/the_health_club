class WorkoutsController < ApplicationController

  # GET: /workouts
  get "/workouts" do
    @new_workout = Workout.all
    erb :"/workouts/index.html"
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
    workout = Workout.create(params)
    workout.user_id = current_user
    redirect "/workouts/#{workout.id}"
  end

  # GET: /workouts/5
  get "/workouts/:id" do
    if logged_in?
      @workout = Workout.find(params[:id])
    erb :"/workouts/show.html"
    else  
      redirect to '/'
    end
  end

  # GET: /workouts/5/edit
  get "/workouts/:id/edit" do
    @workout = Workout.find(params[:id])
    if current_user == @workout.user
    erb :"/workouts/edit.html"
    else
   redirect to '/'
    end
  end

  # PATCH: /workouts/5
  patch "/workouts/:id" do
    #find the workout dynamically aka by id
    if logged_in?
       @workout = Workout.find(params[:id])
       @workout.update(params[:id])
       erb :"/workouts/edit.html"
    #update it via .update
      else
      redirect "/workouts/#{@workout.id}"
    end
  end

  # DELETE: /workouts/5/delete
  delete "/workouts/:id/delete" do
    redirect "/workouts"
  end
end
