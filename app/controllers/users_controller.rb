class UsersController < ApplicationController

 

  # GET: /users/new
  get "/signup" do
    erb :"/users/signup.html"
  end

  # POST: /users
  post "/signup" do
  user = User.create(params["user"])
    if user.valid?
      flash[:success] = "Successfully logged in!"
      session["user_id"] = user.id
      redirect '/movies'
    else
      flash[:error] = user.errors.full_messages.first
      redirect '/signup'
    end
 
  end

  # GET: /users/5
  get "/users/:id" do
    redirect_if_not_logged_in
    #find user with id 
    user = User.find_by(id: id)
    #if current_user == user
      if current_user == user
        erb :"/users/show.html"
      else
        redirect "/users/#{current_user.id}"
      end
  end

#   # GET: /users/5/edit
#   get "/users/:id/edit" do
#     erb :"/users/edit.html"
#   end

#   # PATCH: /users/5
#   patch "/users/:id" do
#     redirect "/users/:id"
#   end

#   # DELETE: /users/5/delete
#   delete "/users/:id/delete" do
#     redirect "/users"
#   end
end
