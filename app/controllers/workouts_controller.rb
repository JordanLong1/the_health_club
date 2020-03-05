class WorkoutsController < ApplicationController

  # GET: /workouts
  get "/workouts" do
    erb :"/workouts/index.html"
  end

  # GET: /workouts/new
  get "/workouts/new" do
    erb :"/workouts/new.html"
  end

  # POST: /workouts
  post "/workouts" do
    redirect "/workouts"
  end

  # GET: /workouts/5
  get "/workouts/:id" do
    erb :"/workouts/show.html"
  end

  # GET: /workouts/5/edit
  get "/workouts/:id/edit" do
    erb :"/workouts/edit.html"
  end

  # PATCH: /workouts/5
  patch "/workouts/:id" do
    redirect "/workouts/:id"
  end

  # DELETE: /workouts/5/delete
  delete "/workouts/:id/delete" do
    redirect "/workouts"
  end
end
