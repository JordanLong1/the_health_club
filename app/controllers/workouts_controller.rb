class WorkoutsController < ApplicationController

  # GET: /workouts
  get "/workouts" do
    @new_workout = Workout.all
    erb :"/workouts/index.html"
  end

  # GET: /workouts/new
  get "/workouts/new" do
    erb :"/workouts/new.html"
  end

  # POST: /workouts
  post "/workouts" do
    workout = Workout.create(params)
    redirect "/workouts/#{workout.id}"
  end

  # GET: /workouts/5
  get "/workouts/:id" do
    @workout = Workout.find(params[:id])
    if current_user == @workout.user
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
   redirect to '/'
    end
  end

  # PATCH: /workouts/5
  patch "/workouts/:id" do
    #find the workout dynamically aka by id
    @workout = Workout.find(params[:id])
    @workout.update(params[:id])
    #update it via .update
    redirect "/workouts/#{@workout.id}"
  end

  # DELETE: /workouts/5/delete
  delete "/workouts/:id/delete" do
    redirect "/workouts"
  end
end
